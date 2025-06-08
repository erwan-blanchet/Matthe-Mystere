extends Control

# Récupérer les boutons du premier panel de choix de cours
@onready var btnCoursAddition = $Marges/PanelAccueilCours/ConteneurBoutonsCours/btnCoursAddition as Button
@onready var btnCoursSoustraction = $Marges/PanelAccueilCours/ConteneurBoutonsCours/btnCoursSoustraction as Button
@onready var btnCoursComparaison = $Marges/PanelAccueilCours/ConteneurBoutonsCours/btnCoursComparaison as Button

# Récupérer les boutons du affichant le cours des additions
@onready var btnVideoAddition = $Marges/PanelCoursAddition/separationFormat/separationAutreFormat/btnVideo as Button
@onready var btnArticleAddition = $Marges/PanelCoursAddition/separationFormat/separationAutreFormat/btnArticle as Button

# Récupérer les boutons du affichant le cours des soustractions
@onready var btnVideoSoustraction = $Marges/PanelCoursSoustraction/separationFormat/separationAutreFormat/btnVideo as Button
@onready var btnArticleSoustraction = $Marges/PanelCoursSoustraction/separationFormat/separationAutreFormat/btnArticle as Button

# Récupérer les boutons du affichant le cours des soustractions
@onready var btnVideoComparaison = $Marges/PanelCoursComparaison/separationFormat/separationAutreFormat/btnVideo as Button
@onready var btnArticleComparaison = $Marges/PanelCoursComparaison/separationFormat/separationAutreFormat/btnArticle as Button

# Récupérer les panels
@onready var panelAccueilCours = $Marges/PanelAccueilCours as Panel
@onready var panelCoursAddition = $Marges/PanelCoursAddition as Panel
@onready var panelCoursSoustraction = $Marges/PanelCoursSoustraction as Panel
@onready var panelCoursComparaison = $Marges/PanelCoursComparaison as Panel




# APPELER LORDQUE LE NOEUDS ENTRE DANS L'ARBRE DE SCENE POUR LA PREMIERE FOIS.
func _ready():
	# Appeler la fonction de gestion des cliques sur la scène.
	gestion_clic_bouton()




# FONCTION QUI GERE LES CLIQUES SUR LES BOUTONS. 
func gestion_clic_bouton()-> void:
	# Quand le bouton du cours sur les addtions est cliqué, on appelle la fonction btnCoursAddition_clique.
	btnCoursAddition.button_down.connect(btnCoursAddition_clique)
	# Quand le bouton du cours sur les soustractions est cliqué, on appelle la fonction btnCoursSoustraction_clique.
	btnCoursSoustraction.button_down.connect(btnCoursSoustraction_clique)
	# Quand le bouton du cours sur les comparaisons est cliqué, on appelle la fonction btnCoursComparaison_clique.
	btnCoursComparaison.button_down.connect(btnCoursComparaison_clique)
	# Quand le bouton de lancement de la vidéo sur les additions est cliqué, on appelle la fonction btnVideoAddition_clique.
	btnVideoAddition.button_down.connect(btnVideoAddition_clique)
	# Quand le bouton de lancement d'article sur les additions  est cliqué, on appelle la fonction btnArticleAddition_clique.
	btnArticleAddition.button_down.connect(btnArticleAddition_clique)
	# Quand le bouton de lancement de vidéo sur les soustractions  est cliqué, on appelle la fonction btnVideoSoustraction_clique.	
	btnVideoSoustraction.button_down.connect(btnVideoSoustraction_clique)
	# Quand le bouton de lancement d'article sur les soustractions  est cliqué, on appelle la fonction btnArticleSoustraction_clique.
	btnArticleSoustraction.button_down.connect(btnArticleSoustraction_clique)
	# Quand le bouton de lancement d'article sur les comparaisons  est cliqué, on appelle la fonction btnVideoComparaison_clique.
	btnVideoComparaison.button_down.connect(btnVideoComparaison_clique)
	# Quand le bouton de lancement d'article sur les comparaisons  est cliqué, on appelle la fonction btnArticleComparaison_clique.
	btnArticleComparaison.button_down.connect(btnArticleComparaison_clique)


# FONCTION QUI AFFICHE LE COURS DES ADDITIONS.
func btnCoursAddition_clique()->void:
	# Changer de panel.
	panelAccueilCours.visible = false
	panelCoursAddition.visible = true

# FONCTION QUI AFFICHE LE COURS DES SOUSTRACTIONS.
func btnCoursSoustraction_clique()->void:
	# Changer de panel.	
	panelAccueilCours.visible = false
	panelCoursSoustraction.visible = true

# FONCTION QUI AFFICHE LE COURS DES COMPARAISONS.
func btnCoursComparaison_clique()->void:
	# Changer de panel.	
	panelAccueilCours.visible = false
	panelCoursComparaison.visible = true

# FONCTION QUI LANCE LA VIDEO EXPLICATIVE SUR LES ADDITIONS.
func btnVideoAddition_clique() -> void:
	# Déclarer le lien de la vidéo.
	var videoURL = "https://www.youtube.com/watch?v=CwEPbSwEyFo"
	# Ouvrir la vidéo.
	OS.shell_open(videoURL)

# FONCTION QUI LANCE L'ARTICLE EXPLICATIF SUR LES ADDITIONS.
func btnArticleAddition_clique() -> void:
	# Déclarer le lien de l'article.
	var articleURL = "https://maitrelucas.fr/lecons/les-additions-cp/"
	# Ouvrir l'article.
	OS.shell_open(articleURL)

# FONCTION QUI LANCE LA VIDEO EXPLICATIVE SUR LES SOUSTRACTIONS.
func btnVideoSoustraction_clique() -> void:
	# Déclarer le lien de la vidéo.
	var videoURL = "https://www.youtube.com/watch?v=-Ga6DhnJPpE"
	# Ouvrir la vidéo.
	OS.shell_open(videoURL)

# FONCTION QUI LANCE L'ARTICLE EXPLICATIF SUR LES SOUSTRACTIONS.
func btnArticleSoustraction_clique() -> void:
	# Déclarer le lien de l'article.
	var articleURL = "https://maitrelucas.fr/lecons/debuter-les-soustractions-cp/"
	# Ouvrir l'article.
	OS.shell_open(articleURL)

# FONCTION QUI LANCE LA VIDEO EXPLICATIVE SUR LES COMPARAISONS.
func btnVideoComparaison_clique() -> void:
	# Déclarer le lien de la vidéo.
	var videoURL = "https://www.youtube.com/watch?v=n5_B0GdNe-M"
	# Ouvrir la vidéo.
	OS.shell_open(videoURL)

# FONCTION QUI LANCE L'ARTICLE EXPLICATIF SUR LES COMPARAISONS.
func btnArticleComparaison_clique() -> void:
	# Déclarer le lien de l'article.
	var articleURL = "https://maitrelucas.fr/lecons/comparer-des-nombres-cp-ce1/"
	# Ouvrir l'article.
	OS.shell_open(articleURL)

