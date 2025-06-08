extends HBoxContainer
class_name ButtonProgressBar

@onready var progress_bar_panel = $HBoxContainer/Panel_progress_bar as Panel
@onready var progress_bar = $HBoxContainer/Panel_progress_bar/ProgressBar as ProgressBar
@onready var btn_haut = $HBoxContainer/Button_haut as Button

@export var signal_name : String

# Called when the node enters the scene tree for the first time.
func _ready():
	mise_a_jour()

func mise_a_jour():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# fonction connécté au bouton de la progress bar pour réduire le son, je n'ai pas réussi à faire suivre le son de l'ordinateur en fonction des clics
func _on_button_bas_pressed():
	emit_signal(signal_name)
	progress_bar.value -= 1
	mise_a_jour()

# fonction connécté au bouton de la progress bar pour augmenter le son, je n'ai pas réussi à faire suivre le son de l'ordinateur en fonction des clics
func _on_button_haut_pressed():
	emit_signal(signal_name)
	progress_bar.value += 1
	mise_a_jour()
