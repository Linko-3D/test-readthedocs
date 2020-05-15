Imprimante 3D: 3D UP BOX+
========================
.. attention:: **BROUILLON = fautes**

Todo:
chercher où trouver temps d'impression
chercher si option poser au sol comme dans Cura

Aide:
techno@a4.fr

Forum:
https://www.tiertime.com/forum/viewforum.php?f=38&sid=f768523e04b301e1dbebcfb3635fbc5a

Matériel
--------

- `Site officiel <https://www.tiertime.com/up-box-plus/>`_
- `FAQ <https://www.a4.fr/wiki/index.php?title=FAQ_Imprimantes_3D_TIERTIME>`_

.. image:: upbox.png

Logiciel
--------

- `Télécharger Up Studio <https://s3-us-west-1.amazonaws.com/up3d/downloads/UP_Studio_x64_2.6.49.627.zip>`_ (logiciel pour préparer le modèle à l'impression)

Utilisation
-----------

Préparation du matériel
^^^^^^^^^^^^^^^^^^^^^^^

.. attention:: Todo parler des deux types de plateaux: UP Flex Board et Perf Board.

- Installez le plateau en le plaquant contre celui en aluminium. Alignez les vis, puis poussez vers le fond en utilisation toute la surface de vos mains.
- Enlevez le couvercle magnétique, ajoutez le filament sur le côté du dévidoir. Si la bobine est épaisse, utilisez la prolongation de fixation avant de placer la bobine. Décrochez le guide-fil de l'extrudeur, faites passer le filament dans le guide jusqu'à le voir de l'autre côté puis placez le fil dans l'extrudeur. 
  Remettez le couvercle magnétique.
- Branchez l'imprimante. Mettez le bouton à l'arrière de l'imprimante sur On. Restez appuyé sur Power pour initialiser l'imprimante.
- Lancez le logiciel **Up Studio** (lien de téléchargement plus haut), c'est un logiciel dans lequel vous importez vos modèles 3D afin de générer un fichier avec les instructions sur la fabrication de celui-ci par l'imprimante 3D.

.. note:: - Au premier lancement du logiciel, il vous sera demandé de vous connecter à un compte, nous vous invitons à créer le vôtre. Cliquez à gauche sur Account (compte), puis au centre sur Sign Up (s'inscrire).
   - Lors de votre connexion cochez "Auto Login" pour vous reconnecter automatiquement au lancement du logiciel.

- Calibrez le plateau (à faire impérativement après un transport de l'imprimante), pour celà cliquez sur l'icône Calibration représenté par deux règles perpendiculaire, dans la fenêtre qui s'ouvre cliquez sur Auto Level.

.. attention:: TODO: pendant le calibrage, l'imprimante va mesurer la taille de la buse (extrudeur), si l'imprimante fait un bruit de percussion [..]

.. image:: calibration.png

- Allez dans Maintenance et vérifiez que le Material type soit bien sur PLA et que le Print Board soit celui qui est dans l'imprimante (Perf Board ou Up Flex Board).

.. image:: pla.png

- Pour préparer l'impression et déboucher la buse, cliquez sur l'icône Maintenance puis sur Extrude, le filament va sortir de la buse, cliquez sur Stop et coupez le à la base avec des ciseaux.

Préparer une impression
^^^^^^^^^^^^^^^^^^^^^^^

- Charger le modèle avec le bouton +. Vous pouvez ajouter un polygone de base qui vous est proposé ou importer un modèle 3D au format .stl ou .obj en cliquant sur Add 3D Model.

.. image:: 3dmodel.png

Pour vous déplacer dans la vue 3D:

- le clic gauche permet de tourner dans la vue 3D
- la molette permet d'avancer ou reculer
- le clic droit déplace la vue sur les côtés

Todo: ajuster modèle avec la roue
todo: se déplacer dans la vue 3D



Récupérer un modèle sur internet
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- `Thingiverse <https://www.thingiverse.com/>`_

.. note:: Les fichiers sont généralement compressés dans un fichier au format .zip, pour utiliser son contenu double-cliquez dessus puis glissez les fichiers à l'intérieur dans un dossier préalablement créé dans l'ordinateur.
   Vous pouvez ne décompresser que les fichiers .stl, ce sont les modèles 3D.

Lancer une impression
^^^^^^^^^^^^^^^^^^^^^^

Calibration auto

Maintenance extrudeur

Charger modèle en cliquant sur le +