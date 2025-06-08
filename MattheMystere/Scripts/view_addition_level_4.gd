extends Control
class_name additionlvl4


#================== VARIABLE ET NOEUDS ==================#
#**** Récupération des noeuds ****#
@export var lbl_message:Label
@export var lbl_first_number:Label
@export var textExdit_answer: TextEdit
@export var lbl_resultat: Label
@export var btn_valider: Button
@export var btn_recup_image: Button
@export var view_addition_lvl4: Panel
@export var panel_image: Panel
@export var btn_suivant: Button

#**** générateur de nombre aléatoire ****#
var rng = RandomNumberGenerator.new()

#**** Vairable de classe ****#
var rnd_first_nummber = rng.randi_range(1,50)
var rnd_second_number = rng.randi_range(1,50)
var resultat: int
var valeur_attendue: int

#--- Chargement de la view chemin ---#
@onready var view_chemin: PackedScene = preload("res://Scenes/view_chemin.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	_init_vue()
	_gestion_click_boutton()


#================================= FONCTIONS DE CLASSE =================================#
#**** Fonction d'initialisation du niveau ****#
func _init_vue() -> void:
	resultat = rnd_first_nummber + rnd_second_number
	lbl_first_number.text = str(rnd_first_nummber)
	lbl_resultat.text = str(resultat)
	valeur_attendue = int(lbl_resultat.text) - int(lbl_first_number.text)
	
#**** Fonction qui reagit au clic du boutton valider ****#
func on_click_btn_valider() -> void:
	_verif_calcul()

#**** Fonction qui reagit au clic du boutton suivant ****#	
func on_click_btn_recup_image() -> void:
	view_addition_lvl4.visible = false
	panel_image.visible = true
	
func on_click_btn_suivant () -> void:
	panel_image.visible = false
	var vue_chemin = view_chemin.instantiate()
	get_parent().add_child(vue_chemin)
	vue_chemin.CURRENT_NIVEAU = 5
	vue_chemin.visible = true	
#*** Fonction appelé par la fonction [on_click_btn_valider] qui vérifie le calcul ****#
func _verif_calcul() -> void:
	var get_answer = textExdit_answer.text
	
	if (get_answer.is_empty()):
		print("VEUILLEZ REMPLIR LE CHAMP")
		$Timer_show_message_error.start()
		lbl_message.text = "VEUILLEZ REMPLIR LE CHAMP"
	else:
		if(get_answer != str(valeur_attendue)):
			print("RÉPONSE FAUSSE")
			$Timer_show_message_error.start()
			lbl_message.text = "RÉPONSE FAUSSE"
		else:
			print("BONNE RÉPONSE")
			$Timer_show_message.start()
#*************************************************************************************#

#**** gestionnaire de click sur boutton ****#
func _gestion_click_boutton() -> void:
	btn_valider.button_down.connect(on_click_btn_valider)
	btn_recup_image.button_down.connect(on_click_btn_recup_image)
	btn_suivant.button_down.connect(on_click_btn_suivant)
#**************************************************************#

#**** Timer qui affiche un message en cas de mauvaise réponse ****#
func _on_timer_show_message_error_timeout():
	lbl_message.visible = true
#**************************************************************#

#**** timer qui affiche un message en cas de bonne réponse ****#
func _on_timer_show_message_timeout():
	lbl_message.text = "BONNE RÉPONSE"
	lbl_message.visible = true
	btn_recup_image.visible = true
#**************************************************************#
#======================================================================================#

