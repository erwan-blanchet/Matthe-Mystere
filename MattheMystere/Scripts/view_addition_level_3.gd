extends Control
class_name additionLvl3

#============================= VARIABLE DE CLASSE =============================#
#**** Récuprération des noeuds ****#
@export var label_firstNumber: Label
@export var label_resultat: Label
@export var panel_target: Panel
@export var lbl_message: Label
@export var btn_recup_image: Button
@export var view_addition_level_3: Panel
@export var view_image: Panel
@export var btn_suivant: Button

#--- on charge d'avance la scene "draggable" et on stocke dans la variable draggable_scene
@onready var draggable_scene: PackedScene = preload("res://Scenes/draggable.tscn")

#--- Chargement du chemin ---#
@onready var view_chemin: PackedScene = preload("res://Scenes/view_chemin.tscn")

var rng = RandomNumberGenerator.new() # Generateur de nombre 
#--- association des nombres generé aux label et variables
var rnd_firstNumber = rng.randi_range(1,50)
var rnd_secondNumber =  rng.randi_range(1,50)
var item_false:Node = null
var resultat
var valeur_attendu
var valeur_attendu_attribuee: bool = false
#==============================================================================#
# Called when the node enters the scene tree for the first time.
func _ready():
	label_firstNumber.text = str(rnd_firstNumber)
	resultat = rnd_firstNumber + rnd_secondNumber # calcul du resultat
	valeur_attendu = resultat - int(label_firstNumber.text)
	label_resultat.text = str(resultat) # mise a jour du label resultat
	print("[FROM FUNC READY] valeur d'item attendue = " + str(valeur_attendu))
	panel_target.item_dropped_on_target.connect(verif_calcul)
	_generate_draggables()
	_gestionnaire_click_boutton()
	
	
#====================== FONCTIONS DE CLASSE	======================#
#******* Fonction qui genere les items a déplacer *******#
func _generate_draggables():
	var correct_reponse_index = rng.randi_range(1,6)
	var valeur_attendue_attribuee = false 
	for i in range(1,7):
		var panels_source = get_node("Panel_principal/HBoxContainer_source/source_item_dragable/Panel"+ str(i))
		var drag_item = draggable_scene.instantiate()
		drag_item.id = i
		if ((not valeur_attendu_attribuee) and (i == correct_reponse_index)):
			drag_item.label.text = str(valeur_attendu)
			print("[INDICE de l'item contenant la réponse]%s"% drag_item.id)
			print("[VALEUR de l'item]%s"% drag_item.label.text)
		else:
			var random_value = calculer_valeur_aleatoire()  # Fonction pour générer une valeur aléatoire
			drag_item.label.text = str(random_value)
		
		panels_source.add_child(drag_item)
#*****************************************************************#	

#****** Fonction qui génère des valeurs aléatoire entre 1 et 50 ******#
func calculer_valeur_aleatoire(min_value: int = 1, max_value: int = 50) -> int:
	return rng.randi_range(min_value, max_value)
#*****************************************************************#	
		
#***** Fonction qui vérifie si l'item déposé est le bon ******#	
func verif_calcul():
	print("[From view_addition_lvl_3 function] An Item has been drop")
	var resultat_target = int(resultat)
	var first_number = int(label_firstNumber.text)
	var second_number: int = 0
	var sum: int = 0
	
	if (panel_target.get_child_count() > 0):
		var existent_item = panel_target.get_child(0)
		print("[The item is : ]%s" % existent_item)
		var label_of_item = existent_item.get_children()
		print("[The label of this Item :] %s"% label_of_item)
		
		for child in label_of_item:
			if child is Label:
				var label_text = str(child.text)
				print("[The value of Item :] %s"% label_text)
				second_number = int(label_text)	
				
	sum = first_number + second_number	
	
	#-- Comparaison le resultat attendue, et le résultat calculer en fonctoin de l ítem déposé
	if(resultat_target != sum): 
		print("The item dropped is : " + str(second_number) + " we waited for the number :" + str(valeur_attendu))
		item_false = panel_target.get_child(0)
		$Timer_false_answer.start()
		$Timer_show_message.start()
		lbl_message.text = "MAUVAISE RÉPONSE, RECOMMENCE !!"
	else:
		print("l'item déposé est le bon")
		lbl_message.text = "BRAVO TU AS TROUVÉ LA BONNE RÉPONSE"
		$Timer_show_message.start()
		$Timer_show_boutton.start()
#*****************************************************************#

#****** Fonction qui réagit au boutton [btn_suivant] *****#
func _on_click_btn_recup_image() -> void:
	view_addition_level_3.visible = false
	view_image.visible = true

func _on_click_btn_suivant() -> void:
	view_image.visible = false
	var vue_chemin = view_chemin.instantiate()
	get_parent().add_child(vue_chemin)
	vue_chemin.CURRENT_NIVEAU = 4
	vue_chemin.visible = true
#****** Gestionnaire de click sur un boutton *****#
func _gestionnaire_click_boutton() -> void:
	btn_recup_image.button_down.connect(_on_click_btn_recup_image)
	btn_suivant.button_down.connect(_on_click_btn_suivant)
#****** TIMER programmé pour retirer l'item si c'est faux ******#
func _on_timer_false_answer_timeout():
	if item_false != null:
		panel_target.remove_child(item_false)	
		lbl_message.visible = false
	else:
		print("item_false non trouvé dans le panel_target")
#*****************************************************************#

#****** TIMER programmé pour retirer l'item si c'est faux ******#
func _on_timer_show_message_timeout():
	lbl_message.visible = true
#*****************************************************************#

#****** TIMER programmé pour retirer l'item si c'est faux ******#
func _on_timer_show_boutton_timeout():
	btn_recup_image.visible = true
#*****************************************************************#
#====================== FINFONCTIONS DE CLASSE	======================#
