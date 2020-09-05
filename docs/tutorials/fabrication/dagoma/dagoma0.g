;Procédure de nettoyage/débouchage de la buse de Neva et Magis
;
;
;Démarrer la machine avec le filament activant le détect fil sans dépasser l'extrudeur.
;Lancer l'impression de ce fichier.
;L'imprimante chauffe en 3 temps.
;Quand elle est à 15cm du plateau, elle est à 220°C 
;Vous pouvez donc faire vos manipulations.
;Pour la faire refroidir, enlevez la carte SD et débranchez/rebranchez la machine.
;
;Gcode by Timothée
;
G90 ;											Positionnement absolu
G28 ;											Retour à l'origine
;
G0 Z10 F3000 ;									Aller à 1cm du plateau
M109 R100 ;										Chauffer à 100°C
G0 Z100 F3000;									Se placer à 10cm du plateau
M106 S255 ;										Ventilateur ON à 100%
M109 R200										Chauffer à 200°C.
G0 Z150 F3000 ;									Aller à 15cm du plateau
M109 S220 ;										Chauffer à 220°C