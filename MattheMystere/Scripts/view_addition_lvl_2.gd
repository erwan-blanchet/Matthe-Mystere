extends Control
class_name  additionlvl2

#==================== VARIABLE DE CLASSE ====================#
#**** Génèrer nombre aléatoirement
var rng = RandomNumberGenerator.new()
var firstNumber = rng.randi_range(1,50)
var secondNUmber = rng.randi_range(1,50)
var resultat_attendue: int

#**** Récupération des noeuds
@export var lbl_firstNumber: Label
@export var lbl_secondNumber: Label
@export var textEdit: TextEdit
@export var btn_recup_image: Button
@export var btn_valider:Button
@export var lbl_message: Label
@export var btn_suivant: Button

#**** Récupération de la lvl2 et vue Image ****#
@export var panel_addition_lvl2: Panel
@export var panel_vue_image: Panel

#*** Chargement de la scene chemin ****#
@onready var view_chemin: PackedScene = preload("res://Scenes/view_chemin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	_init_vue()
	_gestion_click_button()

#================= FONCTION DE LA CLASSE =================#
#***** Fonction qui initialise les calcul *****#
func _init_vue() -> void:
	resultat_attendue = firstNumber + secondNUmber
	lbl_firstNumber.text = str(firstNumber)
	lbl_secondNumber.text = str(secondNUmber)

#***** Fonction qui fait appel au verif_calcul *****#
func on_click_btn_valider() -> void:
	print("BOUTTON CLIQUE")
	_verif_calcul()

func on_click_btn_recup_image() -> void:
	panel_addition_lvl2.visible = false
	panel_vue_image.visible = true
	
func on_click_btn_suivant() -> void:
	panel_vue_image.visible = false
	var vue_chemin = view_chemin.instantiate()
	get_parent().add_child(vue_chemin)
	vue_chemin.CURRENT_NIVEAU = 3
	vue_chemin.visible = true
	
#***** Fonction qui vérifie le resultat *****#
func _verif_calcul() -> void:
	var get_answer = textEdit.text
	if get_answer.is_empty():
		print("The EDIT TEXT is empty")
		$Timer_message.start()
		lbl_message.text = "The EDIT TEXT is empty"
	else:
		if (resultat_attendue == int(get_answer)):
			$Timer_message.start()
			lbl_message.text = "BONNE REPONSE BRAVOOO !!!"
		else:
			$Timer_message_erreur.start()
			print("OUPSS, TRY AGAIN")
			lbl_message.text = "OUPS, ESSAIE ENCORE !!!"

#***** Gestionnaire de signaux sur les boutton *****#
func _gestion_click_button() -> void:
	btn_valider.button_down.connect(on_click_btn_valider)
	btn_recup_image.button_down.connect(on_click_btn_recup_image)
	btn_suivant.button_down.connect(on_click_btn_suivant)
 	

func _on_timer_message_timeout():
	lbl_message.visible = true
	if (not textEdit.text.is_empty()): 
		btn_recup_image.visible = true

func _on_timer_message_erreur_timeout():
	lbl_message.visible = true
	textEdit.text = ""
