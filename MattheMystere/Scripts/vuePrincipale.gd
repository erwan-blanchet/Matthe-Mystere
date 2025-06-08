class_name MenuJeu
extends Control

#------------------------- Récupérer les bouttons -----------------------
@onready var btnQuitter = $Marge/VBoxContainer/Bandeau/btnQuitter as Button
#******** Boutton appartenant au Navbar Principal ********
@onready var btnAventureEntiere = $Marge/VBoxContainer/HBoxContainer/Menu/Liste/btnAventureEntiere as Button
@onready var btnAventureChoisit = $Marge/VBoxContainer/HBoxContainer/Menu/Liste/btnAventureChoisit as Button
@onready var btnCours = $Marge/VBoxContainer/HBoxContainer/Menu/Liste/btnCours as Button
@onready var btnImages = $Marge/VBoxContainer/HBoxContainer/Menu/Liste/btnImages as Button
@onready var btnPersonnaliser = $Marge/VBoxContainer/HBoxContainer/Menu/Liste/btnPersonnaliser as Button

#******** Boutton appartenant au Navbar Secondaire ********
@onready var btnRetour = $Marge/VBoxContainer/HBoxContainer/Menu2/Liste/btnRetour as Button
@onready var btnAddition = $Marge/VBoxContainer/HBoxContainer/Menu2/Liste/btnAddition as Button
@onready var btnSoustraction = $Marge/VBoxContainer/HBoxContainer/Menu2/Liste/btnSoustraction as Button
@onready var btnComparaison = $Marge/VBoxContainer/HBoxContainer/Menu2/Liste/btnComparaison as Button

#--- Répérer les Navbar ---
@onready var menuPrincipal = $Marge/VBoxContainer/HBoxContainer/Menu as HBoxContainer
@onready var menuSecondaire = $Marge/VBoxContainer/HBoxContainer/Menu2 as HBoxContainer

# Récupérer le panel qui affiche les scéne 
@onready var panelScene = $Marge/VBoxContainer/HBoxContainer/Panel/SceneAccueil
@onready var panel = $Marge/VBoxContainer/HBoxContainer/Panel




# Appeler lorsque le nœud entre dans l'arbre de scène pour la première fois.
func _ready():
	gestion_click_boutton()





# Fonction pour le boutton Quitter du Header 
func btnQuitter_clique() -> void:
	get_tree().quit()

# Fonction qui affiche le parcours entier
func btnAventureEntiere_clique() -> void:
	var nouvelle_scene = preload("res://Scenes/ParcoursEntier.tscn")
	var scene_noeud = nouvelle_scene.instantiate()
	panel.add_child(scene_noeud)

# Fonction pour les appartenant au NavBar Principal 
func btnAventureChoisit_clique() -> void:
	menuPrincipal.visible = false
	menuSecondaire.visible = true

# Fonction qui affiche le cours
func btnCours_clique() -> void:
	var nouvelle_scene = preload("res://Scenes/Cours.tscn")
	var scene_noeud = nouvelle_scene.instantiate()
	panel.add_child(scene_noeud)

# Fonction qui affiche le images
func btnImages_clique() -> void:
	var nouvelle_scene = preload("res://Scenes/Images.tscn")
	var scene_noeud = nouvelle_scene.instantiate()
	panel.add_child(scene_noeud)

# Fonction qui permet la personnalisation
func btnPersonnaliser_clique() -> void:
	var nouvelle_scene = preload("res://Scenes/Personnalisationn.tscn")
	var scene_noeud = nouvelle_scene.instantiate()
	panel.add_child(scene_noeud)

# Fonction pour les appartenant au NavBar Secondaire 
func btnRetour_clique() -> void:
	menuPrincipal.visible = true
	menuSecondaire.visible = false

# Fonction qui affiche le parcours des comparaisons
func btnComparaison_clique()-> void:
	var nouvelle_scene = preload("res://Scenes/Comparaison.tscn")
	var scene_noeud = nouvelle_scene.instantiate()
	panel.add_child(scene_noeud)

# Fonction qui affiche le parcours des soustractions
func btnSoustraction_clique()-> void:
	var nouvelle_scene = preload("res://Scenes/Soustraction.tscn")
	var scene_noeud = nouvelle_scene.instantiate()
	panel.add_child(scene_noeud)

# Fonction qui affiche le parcours des additions
func btnAddition_clique()-> void:
	var nouvelle_scene = preload("res://Scenes/view_chemin.tscn")
	var scene_noeud = nouvelle_scene.instantiate()
	panel.add_child(scene_noeud)




# Fonction de gestion des clicks sur les boutons
func gestion_click_boutton() -> void:
	# Lorsque le bouton Quitter est cliqué déclenché la fonction btnQuitter_clique
	btnQuitter.button_down.connect(btnQuitter_clique)
	# Lorsque le bouton pour l'aventure entière est cliqué déclenché la fonction btnAventureEntiere_clique	
	btnAventureEntiere.button_down.connect(btnAventureEntiere_clique)
	# Lorsque le bouton pour choisir son aventure est cliqué déclenché la fonction btnAventureChoisit_clique	
	btnAventureChoisit.button_down.connect(btnAventureChoisit_clique)
	# Lorsque le bouton pour choisir le cours est cliqué déclenché la fonction btnCours_clique	
	btnCours.button_down.connect(btnCours_clique)
	# Lorsque le bouton pour consulter ses images est cliqué déclenché la fonction btnImages_clique	
	btnImages.button_down.connect(btnImages_clique)
	# Lorsque le bouton pour personnaliser est cliqué déclenché la fonction btnPersonnaliser_clique	
	btnPersonnaliser.button_down.connect(btnPersonnaliser_clique)
	# Lorsque le bouton pour Retour est cliqué déclenché la fonction btnRetour_clique		
	btnRetour.button_down.connect(btnRetour_clique)
	# Lorsque le bouton pour choisir les comparaisons est cliqué déclenché la fonction btnComparaison_clique	
	btnComparaison.button_down.connect(btnComparaison_clique)
	# Lorsque le bouton pour choisir les soustractions est cliqué déclenché la fonction btnSoustraction_clique		
	btnSoustraction.button_down.connect(btnSoustraction_clique)
	# Lorsque le bouton pour choisir les addition est cliqué déclenché la fonction btnAddition_clique		
	btnAddition.button_down.connect(btnAddition_clique)





