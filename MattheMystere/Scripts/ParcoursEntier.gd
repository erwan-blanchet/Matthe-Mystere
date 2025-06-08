extends Control

#--------------------------------------------------------------------------------------------------
#                                       ATTRIBUTS
#--------------------------------------------------------------------------------------------------
# Récupérer les éléments de la scène
@onready var pnl = $Marges/VBoxContainer/PanelContainer as PanelContainer
@onready var btn = $Marges/VBoxContainer/HBoxContainer/btnSuivant as PanelContainer

# Importer les scènes
var sceneAddition = preload("res://Scenes/view_addition_level_5.tscn")
var instanceAddition = sceneAddition.instantiate()
var sceneSoustraction = preload("res://Scenes/Soustraction.tscn")
var instanceSoustraction = sceneSoustraction.instantiate()



#--------------------------------------------------------------------------------------------------
#                                       FONCTIONS
#--------------------------------------------------------------------------------------------------
# FONCTION APPELE AU LANCEMENT DE LA SCENE.
func _ready():
	# Si le parcours des addtions est finit ...
	if instanceAddition.get_fin() == true:
		# ... connecter le bouton.
		btn.button_down.connect(additionFinit)
	# Si le parcours des soustractions est finit ...
	elif instanceSoustraction.get_fin() == true:
		# ... connecter le bouton.
		btn.button_down.connect(soustractionFinit)




# FONCTION QUI AFFICHE LE PARCOURS DES SOUSTRACTIONS
func additionFinit()->void:
	var nouvelle_scene = preload("res://Scenes/Soustraction.tscn")
	var scene_noeud = nouvelle_scene.instantiate()
	pnl.add_child(scene_noeud)

# FONCTION QUI AFFICHE LE PARCOURS DES COMPARAISONS
func soustractionFinit()->void:
	var nouvelle_scene = preload("res://Scenes/Comparaison.tscn")
	var scene_noeud = nouvelle_scene.instantiate()
	pnl.add_child(scene_noeud)

