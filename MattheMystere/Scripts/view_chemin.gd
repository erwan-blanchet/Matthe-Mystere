extends Control

#=============== VARIABLE ET NOEUDS ===============#
#**** Récupération des noeuds ****#
#----- BOUTON UNLOCK -----#
@export var btn_niveau1: Button
@export var btn_niveau2: Button
@export var btn_niveau3: Button
@export var btn_niveau4: Button
@export var btn_niveau5: Button
@export var btn_cours: Button

#---- IMAGE PERSONNAGE ----#
@export var image1: TextureRect
@export var image2: TextureRect
@export var image3: TextureRect
@export var image4: TextureRect
@export var image5: TextureRect

#----- VUE COURS ET NIVEAUX -----#
@export var view_chemin: Panel

#----- COFFRE -----#
@export var coffre_ferme: TextureRect
@export var coffre_couvert: TextureRect

@onready var view_cours: PackedScene = preload("res://Scenes/view_cours_addition.tscn")

#---- CHARGEMENT DES NIVEAU ----#
@onready var view_addition_niveau1 = load("res://Scenes/view_addition_lvl_1.tscn")
@onready var view_addition_niveau2 = load("res://Scenes/view_addition_lvl_2.tscn")
@onready var view_addition_niveau3 = load("res://Scenes/view_addition_level_3.tscn")
@onready var view_addition_niveau4 = load("res://Scenes/view_addition_level_4.tscn")
@onready var view_addition_niveau5 = load("res://Scenes/view_addition_level_5.tscn")

#----- CREATION DE VARIABLE D'AVANCEMENT -----#
@export var CURRENT_NIVEAU = 0

func _process(delta):	
	
	if get_current_niveau() == 1:
		unlock_niveau(1)
		image1.visible = true
	if get_current_niveau() == 2:
		unlock_niveau(1)
		unlock_niveau(2)
		image1.visible = false
		image2.visible = true
	if get_current_niveau() == 3:
		unlock_niveau(1)
		unlock_niveau(2)
		unlock_niveau(3)
		image2.visible = false
		image3.visible = true

	if get_current_niveau() == 4:
		unlock_niveau(1)
		unlock_niveau(2)
		unlock_niveau(3)
		unlock_niveau(4)
		image3.visible = false
		image4.visible = true
	if get_current_niveau() == 5:
		unlock_niveau(1)
		unlock_niveau(2)
		unlock_niveau(3)
		unlock_niveau(4)
		unlock_niveau(5)
		image4.visible = false
		image5.visible = true
	if get_current_niveau() == 6:
		unlock_niveau(1)
		unlock_niveau(2)
		unlock_niveau(3)
		unlock_niveau(4)
		unlock_niveau(5)
		coffre_couvert.visible = true
		coffre_ferme.visible = false
# Called when the node enters the scene tree for the first time.
func _ready():
	_gestion_click_boutton()
	
	
#============== FONCTION DE CLASSE ==============#
	
#**** Fonction qui affiche la valeur de CURRENT_NIVEAU ****#
func afficher_current_niveau() -> void:
	print("[FROM CHEMIN]La valeur de CURRENT_NIVEAU est :", CURRENT_NIVEAU)

func get_current_niveau() -> int:
	return CURRENT_NIVEAU

#**** Fonction qui UNLOCK le [NIVEAU] ****#
func unlock_niveau(index : int , etat := false) -> void:
	for i in $Panel.get_children().size()-1:
		if index == i:
			$Panel.get_child(index).disabled = etat



	
#**** Fonction qui rágit au clic du boutton btncours ****#
func on_click_btn_cours() -> void:
	view_chemin.visible = false
	var vue_cours = view_cours.instantiate()
	get_parent().add_child(vue_cours)
	vue_cours.visible = true

#**** Fonction qui réagit au clique des boutons de niveau ****#
func on_click_btn_niveau1() -> void:
	view_chemin.visible = false
	var view_niveau1 = view_addition_niveau1.instantiate()
	get_parent().add_child(view_niveau1)
	view_niveau1.visible = true
	image1.visible = false

func on_click_btn_niveau2() -> void:
	view_chemin.visible = false
	var view_niveau2 = view_addition_niveau2.instantiate()
	get_parent().add_child(view_niveau2)
	view_niveau2.visible = true
	
func on_click_btn_niveau3() -> void:
	view_chemin.visible = false
	var view_niveau3 = view_addition_niveau3.instantiate()
	get_parent().add_child(view_niveau3)
	view_niveau3.visible = true

func on_click_btn_niveau4() -> void:
	view_chemin.visible = false
	var view_niveau4 = view_addition_niveau4.instantiate()
	get_parent().add_child(view_niveau4)
	view_niveau4.visible = true

func on_click_btn_niveau5() -> void:
	view_chemin.visible = false
	var view_niveau5 = view_addition_niveau5.instantiate()
	get_parent().add_child(view_niveau5)
	view_niveau5.visible = true
	
#**** gestionnaire de click sur boutton ****#
func _gestion_click_boutton() -> void:
	btn_cours.button_down.connect(on_click_btn_cours)
	btn_niveau1.button_down.connect(on_click_btn_niveau1)
	btn_niveau2.button_down.connect(on_click_btn_niveau2)
	btn_niveau3.button_down.connect(on_click_btn_niveau3)
	btn_niveau4.button_down.connect(on_click_btn_niveau4)
	btn_niveau5.button_down.connect(on_click_btn_niveau5)
#**************************************************************#
