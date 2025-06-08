extends Control
class_name viewAdditionlvl1
#-- NIVEAU 1 CONSISTE A COCHER LE RESULTAT D'UN CALCUL --#

#---- Récupération des noeuds ----#
@export var lbl_firstNumber: Label
@export var lbl_secondeNumber:Label
@export var lbl_resultat:Label
@export var lbl_message: Label
#**** recupération des checkbox représentant les reponses possible ****#
@export var first_reponse:CheckBox
@export var second_reponse:CheckBox
@export var third_reponse:CheckBox
@export var fourth_reponse:CheckBox
#*** recupération des boutons ***#
@export var btn_validerReponse:Button
@export var btn_suivant:Button
@export var btn_recup_image: Button


#--- Variable de classe ---#
var rng = RandomNumberGenerator.new() #-- generateur de nombre aléatoire
var rnd_firstNumber = rng.randi_range(1,10) #-- Premier nombre aléatoire généré
var rnd_secondNumber = rng.randi_range(1,10) #-- Premier nombre aléatoire généré
var resultat #-- variable qui contient le resultat du calcul généré

#--- View lvl1 et lvl2 ---#
@export var view_level_1: Panel
@export var panel_image_gagne: Panel

#--- chargement du chemin ----#
@onready var view_chemin: PackedScene = preload("res://Scenes/view_chemin.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	initialisation_vue()
	gestion_click_button()
			
			

#----- Fonctions qui gère les èvenement a effectué lors d'un click sur un bouttons---#
#====== FONCTION QUI INITIALISE LA VUE ======# 
func initialisation_vue() -> void:
	lbl_resultat.visible = false
	resultat = rnd_firstNumber + rnd_secondNumber #-- Calcul du resultat
	#lbl_resultat.text = str(resultat) #-- Misa a jour du resultat
	lbl_firstNumber.text = str(rnd_firstNumber)
	lbl_secondeNumber.text = str(rnd_secondNumber)
	#--- Variable qui indiqura le checkbox qui contiendra la reponse a coché
	var correct_reponse_index = rng.randi_range(1,4)
	#--- Attribution des réponses aux checkbox
	for i in range(1,5):
		var checkbox = get_node("Panel/GridContainer_reponse/CheckBox" + str(i))
		if i == correct_reponse_index:
			checkbox.text = str(resultat)
		else:
			var random_answer = generate_random_answer(resultat)
			checkbox.text = str(random_answer)
#=============================================#		

#============== FONCTION QUI PERMET DE CHOCHER QUE SUR UN CHECKBOX PAS PLUS ==============#
func on_checkbox_clicked(toogled_on, name, value):
	print(toogled_on, name, value)
	if !toogled_on : #-- Vérifie si le boutton de case a cocher est bien activé ou désactivé
		return
	
	for i in $Panel/GridContainer_reponse.get_children():
		if (i.name != name) :
			if (i is CheckBox):
				i.button_pressed = false
#==========================================================================================#		

#======= FONCTION FAISANT APPEL A LA FONCTION DE VERIFICATION DE LA REPONSE COCHEE =======# 	
func on_click_btn_valider_reponse() -> void:
	verif_reponse()
#==========================================================================================#

#========== FONCTION verif_reponse QUI TESTE SI REPONSE COCHEE EST LA BONNE OU PAS ========# 	
func verif_reponse() -> void:
	var une_case_coche = false
	var check_reponse: int = -1 # variable qui stocke la reponse de l'utilisteur
	lbl_resultat.text = str(resultat) # label qui stocke la bonne reponse
	print("Reponse : "+ lbl_resultat.text)
	for i in $Panel/GridContainer_reponse.get_children():
		if (i is CheckBox):
			if (i.button_pressed == true):
				une_case_coche = true
				check_reponse = int(i.text)
				break
	
	if (une_case_coche):
		print("Nous nous respectons la condition")
		if (str(check_reponse) == str(lbl_resultat.text)) : #-- si reponse coché est égale a la reponse attendue
			print("Bonne Réponse cochée")
			$Timer_show_message.start()		
			lbl_message.text = "BRAVOO !!" 
			
		else: #-- sinon 
			print("Mauvaise réponse")
			$Timer_show_message_error.start()
			lbl_message.text = "Mauvaise réponse"
	else:
		print("Aucune case n'est cochée")
#=====================================================================================#
#========== FONCTION qui permet resuperer l'image gagné ========# 	
func on_click_btn_recup_image() -> void:
	print("BOUTON SUIVANT CLICKED")
	view_level_1.visible = false
	panel_image_gagne.visible = true

func on_click_btn_suivant() -> void:
	panel_image_gagne.visible = false
	
	var vue_chemin = view_chemin.instantiate()
	get_parent().add_child(vue_chemin)
	vue_chemin.CURRENT_NIVEAU = 2
	vue_chemin.visible = true
#=====================================================================================#
#=====================================================================================#
#**** Fonction pour générer une réponse aléatoire différente du résultat ****#
func generate_random_answer(correct_answer):
	var random_answer = rng.randi_range(1, 10)
	while random_answer == correct_answer:
		random_answer = rng.randi_range(1, 10)
	return random_answer

#*** Fonction qui gère les signaux click des bouttons ***#	
func gestion_click_button() -> void:
	btn_validerReponse.button_down.connect(on_click_btn_valider_reponse)
	btn_recup_image.button_down.connect(on_click_btn_recup_image)
	btn_suivant.button_down.connect(on_click_btn_suivant)

func _on_timer_show_message_timeout():
	lbl_resultat.visible = true #-- on rend visible le label avec la reponse
	btn_recup_image.visible = true	
	lbl_message.visible = true


func _on_timer_show_message_error_timeout():
	lbl_message.visible = true
