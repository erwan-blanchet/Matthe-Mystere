extends Control

# Récupérer les boutons
@onready var btnDemarrer = $HBoxContainer/btnDemarrer as Button
@onready var btnFermer = $HBoxContainer/btnFermer as Button

# Récupérer la scène
@onready var lancementJeu = "res://Scenes/vuePrincipale.tscn" 




# Appeler lorsque le nœud entre dans l'arbre de scène pour la première fois.
func _ready():
	gestion_signaux_buttons()




#--- Fonctions qui gère les èvenement a effectué lors d'un click sur un bouttons---#
func on_click_btn_quitter() -> void:
	get_tree().quit()
	
func on_click_btn_lancer() -> void:
	get_tree().change_scene_to_file(lancementJeu)
#-----------------------------------------------------------------------------------#

#--- Fonction qui gère les signaux click des bouttons ---#
func gestion_signaux_buttons() -> void:
	btnDemarrer.button_down.connect(on_click_btn_lancer)
	btnFermer.button_down.connect(on_click_btn_quitter)


# Appelé à chaque image. 'delta' est le temps écoulé depuis l'image précédente.
func _process(delta):
	pass

