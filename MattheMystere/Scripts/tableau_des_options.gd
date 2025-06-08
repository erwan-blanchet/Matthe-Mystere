extends Control

@onready var btn_son_1 = $TabContainer/Son/MarginContainer/ColorRect/HBoxContainer/Button_son_1 as Button
@onready var btn_son_2 = $TabContainer/Son/MarginContainer/ColorRect/HBoxContainer/Button_son_2 as Button

# Called when the node enters the scene tree for the first time.
func _ready():
	gestion_des_sons()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func gestion_des_sons():
	# lors du clic sur le premier bouton on jour le son applaudissement
	btn_son_1.button_down.connect(jouer_son_1)
	# lors du clic sur le premier bouton on jour le son clic d'une souris
	btn_son_2.button_down.connect(jouer_son_0)


# cette fonction va permettre de lancer un son lors du clic sur le bouton correspondant
func jouer_son_1()->void:
	print("Lecture du son 'applaudissement'")
	# chargement du son
	var son = preload("res://Sons/son_applaudissement.mp3")
	var audio = AudioStreamPlayer.new()
	audio.stream = son
	add_child(audio)
	audio.play(0.0)


# cette fonction va permettre de lancer un son lors du clic sur le bouton correspondant
func jouer_son_0()->void:
	print("Lecture du son 'clic'")
	var son = preload("res://Sons/son_clic.mp3")
	# chargement du son
	var audio = AudioStreamPlayer.new()
	audio.stream = son
	add_child(audio)
	audio.play(0.0)


