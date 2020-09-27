Network
=======

NETWORK.gd

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
		
		spawn_player(get_tree().get_network_unique_id())
		
	func spawn_player(id):
		var player_instance = load(player).instance()
		get_tree().get_root().add_child(player_instance)
		player_instance.name = str(id)
		player_instance.set_network_master(id)

	func _on_network_peer_connected(id):
		spawn_player(id)

	func _on_network_peer_disconnected(id):
		get_tree().get_root().find_node(str(id), true, false).queue_free()


Player.gd

::

	extends KinematicBody2D

	puppet var puppet_transform = transform

	func _ready():
		get_tree().connect("network_peer_connected", self, "_on_network_peer_connected")

	func _physics_process(delta):
		if is_network_master():
			if Input.is_action_pressed("ui_right"):
				position.x += 10
			rset_unreliable("puppet_transform", transform)
			if Input.is_action_just_pressed("ui_accept"):
				rpc("toggle_visiblity", visible)
		else:
			transform = puppet_transform

	remotesync func toggle_visiblity(status):
		visible = !status

	remotesync func visiblity(status):
		visible = status

	func _on_network_peer_connected(id):
		if is_network_master():
			rpc("visiblity", visible)