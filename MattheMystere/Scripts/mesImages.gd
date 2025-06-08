# Définir la classe Images qui permet d'attribuer aléatoirement des récompenses à l'utilisateur.
class_name gestionImages
extends Node

#--------------------------------------------------------------------------------------------------
#                                       ATTRIBUTS
#--------------------------------------------------------------------------------------------------
# Liste des images disponibles avec leurs morceaux
var imagesDisponibles = []

# Liste des images déjà collectées par l'utilisateur
var imagesGagnees = []

# Liste des images en cours de collecte par l'utilisateur
var imagesEnCours = []

# Créer un générateur de nombre aléatoire
var generateurAleatoire = RandomNumberGenerator.new() 

# Récupérer le conteneur
@onready var conteneur = $Marges/ConteneurImage as VBoxContainer

# Importer le thème
var theme = load("res://Themes/label_image.tres")

# Déclaration de l'instance statique
static var instance = null




#--------------------------------------------------------------------------------------------------
#                                       FONCTIONS
#--------------------------------------------------------------------------------------------------
# APPELER LORDQUE LE NOEUDS ENTRE DANS L'ARBRE DE SCENE POUR LA PREMIERE FOIS.
func _ready():
	# Si il y a des images déjà collectée ...
	if imagesGagnees.size() > 0 :
		# Parcourir les images collectées.
		for i in range(imagesGagnees.size()):
			# Créer un TextureReact.
			var image = TextureRect.new()
			# Récupérer le chemin de l'image à afficher.
			var chemin = imagesGagnees[i]
			# Charger la texture.
			var texture = load(chemin)
			# Afficher la texture dans le TextureRect.
			image.texture = texture
			# Ajouter le TextureReact au conteneur de grille
			conteneur.add_child(image)
	# Si non ....
	else :
		# Créer un label.
		var lbl = Label.new()
		# Ajouter du texte dans le label.
		lbl.text = "Tu n'as pas encore gagné d'image, mais tu peux partir à l'aventure pour enrichir ton coffre de récompenses !"
		# Appliquer un thème au label
		lbl.theme = theme
		# Ajouter le label au conteneur.
		conteneur.add_child(lbl)

# CONSTRUCTEUR DE LA CLASSE
func _init():
	# Initialiser les attributs.
	imagesDisponibles = [
	["res://Images/Recompenses/balaine.png", ["res://Images/Recompenses/balaine_bas_droit.png", "res://Images/Recompenses/balaine_bas_gauche.png", "res://Images/Recompenses/balaine_haut_droit.png", "res://Images/Recompenses/balaine_haut_gauche.png"]],
	["res://Images/Recompenses/buffalo.png", ["res://Images/Recompenses/buffalo_bas_droite.png", "res://Images/Recompenses/buffalo_bas_gauche.png", "res://Images/Recompenses/buffalo_haut_droit.png", "res://Images/Recompenses/buffalo_haut_gauche.png"]],
	["res://Images/Recompenses/reptile.png", ["res://Images/Recompenses/reptile_bas_droit.png", "res://Images/Recompenses/reptile_bas_gauche.png","res://Images/Recompenses/reptile_haut_droit.png","res://Images/Recompenses/reptile_haut_gauche.png"]],
	["res://Images/Recompenses/toucan.png", ["res://Images/Recompenses/toucan_bas_droite.png", "res://Images/Recompenses/toucan_bas_gauche.png" , "res://Images/Recompenses/toucan_haut_droite.png", "res://Images/Recompenses/toucan_haut_gauche.png"]]
	]
	imagesGagnees = []
	imagesEnCours = []

# FONCTION QUI SELECTIONNE UNE IMAGE ET SES MORCEAUX.
func selectionner_image():
	# Déclarer l'image qui sera sélectionnée;
	var imageSelectionnee = null
	# Tant qu'une image n'a pas été sélectionnée
	while imageSelectionnee == null:
		# Générer un nombre aléatoire.
		var nb = generateurAleatoire.randi_range(0, imagesDisponibles.size()-1)
		# Récupérer l'image à cet indice.
		var image = imagesDisponibles[nb]
		# Récupérer les morceaux de l'image.
		var morceaux = [imagesDisponibles[nb][1][0],imagesDisponibles[nb][1][1],imagesDisponibles[nb][1][2], imagesDisponibles[nb][1][3]]
		# Vérifier si l'image est présente dans les images déjà collectées.
		var imageDejaCollectee = imagesGagnees.find(image) != -1
		# Vérifier si l'image est présente dans les images en cours.
		var imageEnCours = imagesEnCours.find(image) != -1
		# Si l'image n'est ni dans les images en cours ni dans les images collectées ...
		if not imageDejaCollectee and not imageEnCours:
			# ... ajouter l'image et ses morceaux dans l'image sélectionnée et ...
			imageSelectionnee = [image, morceaux]
			# ... l'ajouter aux images en cours.
			imagesEnCours.append(imageSelectionnee)
	# Retourner l'image sélectionnée.
	return imageSelectionnee

# FONCTION QUI COLLECTE UNE IMAGE.
func collecter_image(chemin_image: String):
	# Ajouter l'image principale à celles collectées.
	imagesGagnees.append(chemin_image)
	# Parcourir la liste d'images en cours en ordre inverse.
	for i in range(imagesEnCours.size()-1):
		# Extraire l'image en cours.
		var imageEnCours = imagesEnCours[i][0]
		 # Vérifier si l'image en cours est égale à l'image principale à collecter.
		if imageEnCours == chemin_image:
			# Supprimer l'image de celle en cours.
			imagesEnCours.pop_at(i)
			# Sortir de la boucle car l'image a été trouvée et supprimée.
			break

# FONCTION QUI SUPPRIME UNE IMAGE.
func supprimer_images(image: String):
	# Parcourir la liste d'images en cours en ordre inverse.
	for i in range(imagesGagnees.size()-1):
		# Extraire l'image en cours.
		var imageEnCours = imagesGagnees[i]
		 # Vérifier si l'image en cours est égale à l'image principale à collecter.
		if imagesGagnees == image :
			# Supprimer l'image de celle en cours.
			imagesGagnees.pop_at(i)
			# Sortir de la boucle car l'image a été trouvée et supprimée.
			break
