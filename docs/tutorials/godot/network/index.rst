Network
=======

Lobby.gd:

::

	extends Control

	func _on_Host_pressed():
		NETWORK.create_server()

	func _on_Join_pressed():
		NETWORK.join_server()

NETWORK.gd (singleton):

::

	extends Node

	var player = "res://Player.tscn"
	var map = "res://Map.tscn"

	func _ready():
		get_tree().connect("network_peer_connected", self, "_on_network_peer_connected")
		get_tree().connect("network_peer_disconnected", self, "_on_network_peer_disconnected")

	func create_server():
		var peer = NetworkedMultiplayerENet.new()
		peer.create_server(4242, 32)
		get_tree().set_network_peer(peer)

		load_game()

	func join_server():
		var peer = NetworkedMultiplayerENet.new()
		peer.create_client("127.0.0.1", 4242)
		get_tree().set_network_peer(peer)

		load_game()

	func load_game():
		get_tree().change_scene(map)
		if not get_tree().is_network_server():
			yield(get_tree(), "idle_frame") # To have the time to load the Spawn node we wait one frame
			spawn_player(get_tree().get_network_unique_id())

	func spawn_player(id):
		var player_instance = load(player).instance()
		var spawn = get_tree().get_root().find_node("Spawn", true, false)
		spawn.add_child(player_instance)
		player_instance.name = str(id)
		player_instance.set_network_master(id)

	func _on_network_peer_connected(id):
		if id != 1: # 1 is the server, we don't want to spawn a player from it
			spawn_player(id)

	func _on_network_peer_disconnected(id):
		get_tree().get_root().find_node(str(id), true, false).queue_free()

Player.gd:

::

	extends KinematicBody2D

	var direction = Vector2()

	func _ready():
		get_tree().connect("network_peer_connected", self, "_on_network_peer_connected")
		yield(get_tree(), "idle_frame") # Wait one frame before checking if we are the master of this node
		set_physics_process(is_network_master())
		$Status.visible = is_network_master() # If we are the master, make the Label node visible
		
	func _physics_process(delta):
		direction.x = -Input.get_action_strength("ui_left") + Input.get_action_strength("ui_right")
		direction.y = -Input.get_action_strength("ui_up") + Input.get_action_strength("ui_down")
		direction.normalized()
		move_and_slide(direction * 500)
		
		if direction != Vector2(): # If we are moving the character sends rpc call
			rpc_unreliable("transform_data", transform)
		
		if Input.is_action_just_pressed("ui_accept"):
			rpc("visibility", !visible)

	remote func transform_data(data):
		transform = data

	remotesync func visibility(data):
		visible = data

	func _on_network_peer_connected(id):
		if is_network_master():
			rpc("transform_data", transform)
			rpc("visibility", visible)