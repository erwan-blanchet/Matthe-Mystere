extends Control

@onready var option_button = $HBoxContainer/OptionButton as OptionButton

#Définition d'un dictionnaire contenant des résolutions prédéfinies
const RESOLUTION_DICTIONNARY : Dictionary = {
	"1152 x 648" : Vector2i(1152, 648),
	"1280 x 720" : Vector2i(1280, 720),
	"1920 x 1080" : Vector2i(1920, 1080)
}


# Called when the node enters the scene tree for the first time.
func _ready():
	# Connexion de l'événement item_selected du bouton d'options à la fonction resolution_selectionne
	option_button.item_selected.connect(resolution_selectionne)
	# Appel de la fonction ajout_des_item_resolution pour ajouter les options de résolution au bouton
	ajout_des_item_resolution()



func ajout_des_item_resolution()->void:
	# Parcourt chaque clé (chaîne de caractères représentant la résolution) dans le dictionnaire
	for resolution_size_text in RESOLUTION_DICTIONNARY:
		option_button.add_item(resolution_size_text)

# Fonction appelée lorsqu'une résolution est sélectionnée dans le bouton d'options
func resolution_selectionne(index : int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICTIONNARY.values()[index])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
