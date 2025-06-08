extends Control

var mot_de_passe = 2812

@onready var lineEdit1 = $Panel_code/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/LineEdit1 as LineEdit
@onready var lineEdit2 = $Panel_code/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/LineEdit2 as LineEdit
@onready var lineEdit3 = $Panel_code/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/LineEdit3 as LineEdit
@onready var lineEdit4 = $Panel_code/ColorRect/MarginContainer/VBoxContainer/HBoxContainer/LineEdit4 as LineEdit

@onready var btn_entrer = $Panel_code/ColorRect/MarginContainer/VBoxContainer/btn_entrer as Button
@onready var btn_exit_personnalisation = $Panel_personnalisation/ColorRect/MarginContainer/VBoxContainer/btn_exit as Button

@onready var panel_code = $Panel_code as Panel
@onready var panel_personnalisation = $Panel_personnalisation as Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	initialisation_composants()
	gestion_des_click()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func initialisation_composants()->void:
	lineEdit1.alignment = HORIZONTAL_ALIGNMENT_CENTER
	lineEdit2.alignment = HORIZONTAL_ALIGNMENT_CENTER
	lineEdit3.alignment = HORIZONTAL_ALIGNMENT_CENTER
	lineEdit4.alignment = HORIZONTAL_ALIGNMENT_CENTER
	panel_code.visible = true
	panel_personnalisation.visible = false

func gestion_des_click()->void:
	btn_entrer.button_down.connect(btn_entrer_click)
	btn_exit_personnalisation.button_down.connect(btn_exit_personnalisation_click)


func btn_entrer_click()->void:
	print("Vérification du mot de passe en cours...")
	var mot_de_passe_entree = lineEdit1.text + lineEdit2.text + lineEdit3.text + lineEdit4.text
	if str(mot_de_passe) == mot_de_passe_entree:
		print("Code bon")
		panel_code.visible = false
		panel_personnalisation.visible = true
	else:
		print("Code incorrect")
		$Panel_code/ColorRect/MarginContainer/VBoxContainer/Label_code.text = "Code incorrect"

func btn_exit_personnalisation_click()->void:
	var scene = preload("res://Scenes/vuePrincipale.tscn") as PackedScene
	#var scen_instantiate = scene.instantiate()
	get_tree().change_scene_to_packed(scene)
