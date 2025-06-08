extends Control

#================== VARIABLE ET NOEUDS ==================#
#**** Récupération des noeuds ****#
@export var view_cours: Panel
@export var btn_commencer: Button

#***** Vue chemin *****#
@onready var view_chemin = load("res://Scenes/view_chemin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	_gestionnaire_click_boutton()

#=============== FONCTION DE CLASSE ===============#

func on_click_btn_commencer() -> void:
	view_cours.visible = false
	var vue_chemin = view_chemin.instantiate()
	get_parent().add_child(vue_chemin)
	vue_chemin.CURRENT_NIVEAU = 1
	vue_chemin.visible = true


#**** Gestionnaire de clik sur boutton ****# 
func _gestionnaire_click_boutton() -> void:
	btn_commencer.button_down.connect(on_click_btn_commencer)
