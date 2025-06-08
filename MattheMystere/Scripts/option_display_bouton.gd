extends Control

@onready var option_bouton = $HBoxContainer/OptionButton as OptionButton

# Définition d'un tableau contenant différents modes de fenêtre
const WINDOW_MODE_ARRAY :Array[String] = [
	"Plein écran",
	"Mode fenétré",
	"Fenêtre sans bordure",
	"Plein écran sans bordures"
]



# Called when the node enters the scene tree for the first time.
func _ready():
	# Ajoute les éléments de mode de fenêtre au bouton d'options
	add_window_mode_items()
	# Connecte l'événement item_selected du bouton d'options à la fonction on_window_mode_selected
	option_bouton.item_selected.connect(on_window_mode_selected)


func on_window_mode_selected(index :int)->void:
	match index:
		0: # Plein écran
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: # Mode fenétré
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: # Fenêtre sans bordure
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: # Plein écran sans bordures
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)

func add_window_mode_items()->void:
	for window_mode in WINDOW_MODE_ARRAY:
		option_bouton.add_item(window_mode)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
