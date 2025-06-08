extends Control
class_name additionlvl5

#===================== VARIABLE ET NOEUDS =====================#
#**** Récupération des noeuds ****#
@export var text_probleme: RichTextLabel
@export var textEdit_answer:  TextEdit
@export var btn_valider: Button
@export var lbl_message: Label
@export	var btn_recup_image: Button
@export var btn_retour_chemin: Button
@export var view_image_finale: Panel
@export var view_addition_level5: Panel
@export var coffre_ferme: TextureRect
@export var coffre_ouvert: TextureRect
@export var image_finale: TextureRect
@export var btn_hidden:Button
@export var label_message2: Label
#--- Chargement de la vue chemin ---#
@onready var view_chemin: PackedScene = preload("res://Scenes/view_chemin.tscn")

var chapitreAdditionFinit


#**** Géneration d'un nombre aléatoire ****#
var rng = RandomNumberGenerator.new()
var resultat_attendue: int

var liste_problemes = [
	{"id" : 1, "text" : "Julie a 14 pommes dans son panier. Elle en ramasse 6 de plus dans le verger.\n\nCombien de pommes a-t-elle maintenant en tout ?"},
	{"id" : 2, "text" : "Lucas a 25 crayons dans sa trousse. Il en trouve 9 autres à l'école.\n\nCombien de crayons a t-il ?"},
	{"id" : 3, "text" : "Sarah a 18 bonbons dans son sac. Son frère lui en donne 5 autres.\n\nCombien de bonbons a t-il ?"},
	{"id" : 4, "text" : "Pierre a 7 crayons dans sa trousse. Il en trouve 2 nouveaux par terre, puis les ramasse.\n\nCombien de crayons a t-il ?"},
	{"id" : 5, "text" : "Sophie possède 2 poupées dans sa chambre. Sa grand-mère lui offre 3 nouvelles poupées pour son anniversaire.\n\nCombien de poupées Sophie a-t-elle maintenant en tout?"},
	{"id" : 6, "text" : "Thomas a 6 bonbons dans sa poche. Il en mange 2 en chemin pour rentrer chez lui. En arrivant à la maison, il en trouve 4 autres dans sa chambre.\n\nCombien de bonbons Thomas a-t-il maintenant?"},
	{"id" : 7, "text" : "Lucas possède 34 billes dans sa collection. Son ami lui en donne 32 supplémentaires comme cadeau d'anniversaire.\n\nCombien de billes Lucas a-t-il maintenant en tout?"},
	{"id" : 8, "text" : "Dans le zoo, il y a 9 singes dans l'enclos. Si 5 singes de plus arrivent de la réserve naturelle.\n\nCombien de singes y aura-t-il au total dans l'enclos?"},
	{"id" : 9, "text" : "Il reste 8 glaces dans le congélateur. Si maman en ajoute 4 de plus pour préparer une surprise pour les enfants.\n\nCombien de glaces y aura-t-il au total?"},
	{"id" : 10, "text" : "Laura a déjà 46 fleurs dans son jardin. Elle décide d'en planter 5 de plus dans le parterre devant la maison.\n\nCombien de fleurs Laura aura-t-elle au total dans son jardin?"}
]

var liste_resultats = [
	{"id": 1, "value": "20"},
	{"id": 2, "value": "34"},
	{"id": 3, "value": "23"},
	{"id": 4, "value": "9"},
	{"id": 5, "value": "5"},
	{"id": 6, "value": "8"},
	{"id": 7, "value": "66"},
	{"id": 8, "value": "14"},
	{"id": 9, "value": "12"},
	{"id": 10, "value": "51"}
]



# Called when the node enters the scene tree for the first time.
func _ready():
	_init_vue()
	_gestion_click_boutton()

#====================== FONCTIONS DE LA CLASSE ======================#
#***** Fonction qui initialise le niveau *****#
func _init_vue() -> int:
	var index = rng.randi_range(1,11)#--- Génération d'un index alátoire
	for probleme in liste_problemes:
		if (probleme["id"] == index):
			text_probleme.bbcode_text = probleme["text"]
	
	for resultat in liste_resultats:
		if (resultat["id"] == index):
			resultat_attendue = int(resultat["value"])
			
	print("[Resultat attendue] = "+ str(resultat_attendue))
	return resultat_attendue	
	
#**** Fonction qui déclenche lors du click sur le bouton valider, la verification de la réponse ****#
func on_click_btn_valider() -> void:
	_verif_resultat(resultat_attendue)
	print("[FROM on_click_btn_valider FUNCTION ] resultat attendue : " + str(resultat_attendue))
	
func on_click_btn_recup_image() ->  void:
	view_addition_level5.visible = false
	view_image_finale.visible = true
	
func on_click_btn_hidden() -> void:
	btn_hidden.visible = false
	coffre_ferme.visible = false
	label_message2.visible = false
	image_finale.visible = true
	coffre_ouvert.visible = true
	btn_retour_chemin.visible = true
	
func on_click_btn_retour_chemin() -> void:
	view_addition_level5.visible = false
	var vue_chemin = view_chemin.instantiate()
	get_parent().add_child(vue_chemin)
	vue_chemin.CURRENT_NIVEAU = 6
	vue_chemin.visible = true
	chapitreAdditionFinit = true
	
	
	
	
#**** Fonction qui vérifie la réponse entrée par l'utilisateur ****#	
func _verif_resultat(resultat) -> void:
	var get_answer = textEdit_answer.text 
	if (get_answer.is_empty()):
		print("CHAMP EST VIDE")
		lbl_message.text = "CHAMP EST VIDE"
		lbl_message.visible = true
	else:
		if (get_answer == str(resultat)):
			print("BRAVOO")
			lbl_message.text = "BRAVOO"
			lbl_message.visible = true
			btn_recup_image.visible = true
		else:
			print("OUPS RATÉ")
			lbl_message.text = "OUPS RATÉ"
			lbl_message.visible = true
			
#**** gestionnaire de click sur boutton ****#
func _gestion_click_boutton() -> void:
	btn_valider.button_down.connect(on_click_btn_valider)
	btn_recup_image.button_down.connect(on_click_btn_recup_image)
	btn_hidden.button_down.connect(on_click_btn_hidden)
	btn_retour_chemin.button_down.connect(on_click_btn_retour_chemin)

func get_fin():
	return chapitreAdditionFinit
