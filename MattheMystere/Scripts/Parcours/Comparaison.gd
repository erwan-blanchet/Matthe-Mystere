extends Control

# -------------------------------- Partie générale ------------------------------------- #

# ------------- Tout les boutons sur le panel_chemin --------------- #
@onready var btn_Cours = $ColorRect/MarginContainer/Panel_chemin/btn_cours as Button
@onready var btn_Niveau_1 = $ColorRect/MarginContainer/Panel_chemin/btn_niveau1 as Button
@onready var btn_Niveau_2 = $ColorRect/MarginContainer/Panel_chemin/btn_niveau2 as Button
@onready var btn_Niveau_3 = $ColorRect/MarginContainer/Panel_chemin/btn_niveau3 as Button
@onready var btn_Niveau_4 = $ColorRect/MarginContainer/Panel_chemin/btn_niveau4 as Button
@onready var btn_Niveau_5 = $ColorRect/MarginContainer/Panel_chemin/btn_niveau5 as Button

# -------------- Tooutes les images sur le panel_chemin (personnage, coffre) ------ #
@onready var image_coffre_fermer = $ColorRect/MarginContainer/Panel_chemin/Coffre_ferme
@onready var image_coffre_ouvert = $ColorRect/MarginContainer/Panel_chemin/Coffre_ouvert
@onready var personnage_niveau_1 = $ColorRect/MarginContainer/Panel_chemin/Personne_niveau_1
@onready var personnage_niveau_2 = $ColorRect/MarginContainer/Panel_chemin/Personne_niveau_2
@onready var personnage_niveau_3 = $ColorRect/MarginContainer/Panel_chemin/Personne_niveau_3
@onready var personnage_niveau_4 = $ColorRect/MarginContainer/Panel_chemin/Personne_niveau_4
@onready var personnage_niveau_5 = $ColorRect/MarginContainer/Panel_chemin/Personne_niveau_5

# Importer la classe Images
var gestionImages = preload("res://Scripts/mesImages.gd")
var images = gestionImages.new()
var recompense
# ------------------------------------------------------------------------------------------------ #



 # -------------------------- Composants niveau 1 --------------------------------------- #
# ----------------- CheckBox du niveau 1 -------------------------------------- #
@onready var checkBox_1 = $ColorRect/MarginContainer/Panel_niveau_1/GridContainer/CheckBox_1 as CheckBox
@onready var checkBox_2 = $ColorRect/MarginContainer/Panel_niveau_1/GridContainer/CheckBox_2 as CheckBox
@onready var checkBox_3 = $ColorRect/MarginContainer/Panel_niveau_1/GridContainer/CheckBox_3 as CheckBox

# label de l'opération à résoudre du niveau 1
@onready var label_operation_a_resoudre = $ColorRect/MarginContainer/Panel_niveau_1/Label_operation as Label
# boutons de validation du niveau 1
@onready var btn_valider = $ColorRect/MarginContainer/Panel_niveau_1/btn_valider as Button

# tableau des propositions de reponses, les propositions serront attribuées au checkbox
var tableau_des_propositions = ["est plus grand que", "est plus petit que", "est égal à"]
# nombre aléatoires
var nombre_aleatoire_1_niveau_1 = randi_range(0, 50)
var nombre_aleatoire_2_niveau_1 = randi_range(0, 50)
# ------------------------------------------------------------------------------------------------ #


 # -------------------------- Composants niveau 2 --------------------------------------- #
# nombre aléatoires
var nombre_aleatoire_1_niveau_2 = randi_range(0, 50)
var nombre_aleatoire_2_niveau_2 = randi_range(0, 50)

#label
@onready var label_operation_a_resoudre_niveau_2 = $ColorRect/MarginContainer/Panel_niveau_2/Operation as RichTextLabel
@onready var lineEdit_entree_du_resultat_niveau_2 = $ColorRect/MarginContainer/Panel_niveau_2/LineEdit_entree_du_resultat as LineEdit

# boutons
@onready var btn_valider_niveau2 = $ColorRect/MarginContainer/Panel_niveau_2/btn_valider as Button

# label
@onready var label_explication_niveau_2 = $ColorRect/MarginContainer/Panel_niveau_2/Explication as RichTextLabel
# ------------------------------------------------------------------------------------------------ #



 # -------------------------- Composants niveau 3 --------------------------------------- #


var chiffre_aleatoire_niveau3 = randi_range(0, 50)
var resultat_aleatoire_niveau_3 = randi_range(0, 50)
# ------------------------------------------------------------------------------------------------ #

 # -------------------------- Composants niveau 4 --------------------------------------- #
@onready var btn_valider_niveau_4 = $ColorRect/MarginContainer/Panel_niveau_4/btn_valider as Button
@onready var label_operation = $ColorRect/MarginContainer/Panel_niveau_4/Operation as RichTextLabel
@onready var label_signe = $ColorRect/MarginContainer/Panel_niveau_4/Signe as RichTextLabel
@onready var lineEdit_reponse_niveau_4 = $ColorRect/MarginContainer/Panel_niveau_4/LineEdit_reponse as LineEdit
# ------------------------------------------------------------------------------------------------ #




 # -------------------------- Composants niveau 5 --------------------------------------- #
var nombre_aleatoire_niveau_5 = randi_range(0,2)
# ------------------------------------------------------------------------------------------------ #



# --------------------- TOUTE LES PANELS DANS LA SCENE -------------------- #
@onready var panel_chemin = $ColorRect/MarginContainer/Panel_chemin as Panel
@onready var panel_cours = $ColorRect/MarginContainer/Panel_cours as Panel
@onready var panel_niveau_1 = $ColorRect/MarginContainer/Panel_niveau_1 as Panel
@onready var panel_niveau_2 = $ColorRect/MarginContainer/Panel_niveau_2 as Panel
@onready var panel_niveau_3 = $ColorRect/MarginContainer/Panel_niveau_3 as Panel
@onready var panel_niveau_4 = $ColorRect/MarginContainer/Panel_niveau_4 as Panel
@onready var panel_niveau_5 = $ColorRect/MarginContainer/Panel_niveau_5 as Panel
# --------------------- TOUTE LES PANELS DE RECOMPENSE DANS LA SCENE -------------------- #
@onready var panel_niveau_1_bravo = $ColorRect/MarginContainer/Panel_bravo_niveau_1 as Panel
@onready var panel_niveau_2_bravo = $ColorRect/MarginContainer/Panel_bravo_niveau_2 as Panel
@onready var panel_niveau_3_bravo = $ColorRect/MarginContainer/Panel_bravo_niveau_3 as Panel
@onready var panel_niveau_4_bravo = $ColorRect/MarginContainer/Panel_bravo_niveau_4 as Panel
@onready var panel_niveau_5_bravo = $ColorRect/MarginContainer/Panel_bravo_niveau_5 as Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	# cette fonction va permettre d'initialiser les panels visible ou non au lancement du chapitre comparaison
	initialisation_des_panels()
	# cette fonction permet de faire la gestions des clics sur les différents boutons
	gestion_clic_bouton()
	# cela nous servira pour l'affichage des images de manière aléatoire
	recompense = images.selectionner_image()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# initialisation de tout les panels, recompenses ou non
func initialisation_des_panels()->void:
	panel_chemin.visible = true
	panel_niveau_1.visible = false
	panel_niveau_2.visible = false
	panel_niveau_3.visible = false
	panel_niveau_4.visible = false
	panel_niveau_5.visible = false
	image_coffre_ouvert.visible = false
	image_coffre_fermer.visible = true
	personnage_niveau_1.visible = false
	personnage_niveau_2.visible = false
	personnage_niveau_3.visible = false
	personnage_niveau_4.visible = false
	personnage_niveau_5.visible = false
	
	panel_niveau_1_bravo.visible = false
	panel_niveau_2_bravo.visible = false
	panel_niveau_3_bravo.visible = false
	panel_niveau_4_bravo.visible = false
	panel_niveau_5_bravo.visible = false



func gestion_clic_bouton()-> void:
	btn_Cours.button_down.connect(btn_Cours_click)
	btn_Niveau_1.button_down.connect(btn_Niveau_1_click)
	btn_Niveau_2.button_down.connect(btn_Niveau_2_click)
	btn_Niveau_3.button_down.connect(btn_Niveau_3_click)
	btn_Niveau_4.button_down.connect(btn_Niveau_4_click)
	btn_Niveau_5.button_down.connect(btn_Niveau_5_click)



func btn_Cours_click()->void:
	mise_en_place_niveau(0)


func btn_Niveau_1_click()->void:
	mise_en_place_niveau(1)

func btn_Niveau_2_click()->void:
	mise_en_place_niveau(2)

func btn_Niveau_3_click()->void:
	mise_en_place_niveau(3)

func btn_Niveau_4_click()->void:
	mise_en_place_niveau(4)

func btn_Niveau_5_click()->void:
	mise_en_place_niveau(5)



func btn_fin_de_cours_click()-> void:
	print("Comparaisons - Cours - Fin de la lecture du cours")
	# on masque le panel du cour
	panel_cours.visible = false;
	# on réaffiche le chemin
	panel_chemin.visible = true
	# on affiche le personnage du niveau 1 pour montrer que l'enfant est maintenant au niveau 1
	personnage_niveau_1.visible = true


# en fonction du numero de niveau passé en paramêtres on ouvre, ferme certaine vues
func mise_en_place_niveau(numero_niveau:int)->void:
	
	
	if numero_niveau == 0: # niveau 0, correspond au cours
		print("Comparaisons - Cours - Chargement du cours...")
		panel_chemin.visible = false
		panel_cours.visible = true
		var btn_fin_lecture_cours = $ColorRect/MarginContainer/Panel_cours/btn_fin_lecture_cours as Button
		btn_fin_lecture_cours.button_down.connect(btn_fin_de_cours_click)
		
		
		
		
	if numero_niveau == 1: # niveau 1
		print("Comparaisons - Niveau_1 - Chargement du niveau 1...")
		panel_chemin.visible = false
		panel_niveau_1.visible = true
		generer_operation_aleatoire_niveau_1()
		attribuer_proposition_aleatoirement_au_checkBox_niveau_1()
		var btn_valider = $ColorRect/MarginContainer/Panel_niveau_1/btn_valider as Button
		btn_valider.button_down.connect(verification_resultat_checkbox_niveau_1)
		
		
		
		
		
	if numero_niveau == 2: # niveau 2
		print("Comparaisons - Niveau_2 - Chargement du niveau 2...")
		panel_chemin.visible = false
		panel_niveau_2.visible = true
		var label_operation = $ColorRect/MarginContainer/Panel_niveau_2/Operation
		label_operation.text = str(nombre_aleatoire_1_niveau_2)+" ... "+str(nombre_aleatoire_2_niveau_2)
		var btn_valider_niveau_2 = $ColorRect/MarginContainer/Panel_niveau_2/btn_valider as Button
		btn_valider_niveau_2.button_down.connect(btn_valider_niveau_2_click)
		
		
		
		
	if numero_niveau == 3: # niveau 3
		print("Comparaisons - Niveau_3 - Chargement du niveau 3...")
		panel_chemin.visible = false
		panel_niveau_3.visible = true
		
		generer_probleme_et_resoudre_niveau_3()
		
		
		
		
		
	if numero_niveau == 4: # niveau 4
		print("Comparaisons - Niveau_4 - Chargement du niveau 4...")
		panel_chemin.visible = false
		panel_niveau_4.visible = true
		var btn_valider_niveau_4 = $ColorRect/MarginContainer/Panel_niveau_4/btn_valider as Button
		var label_operation = $ColorRect/MarginContainer/Panel_niveau_4/Operation as RichTextLabel
		var label_signe = $ColorRect/MarginContainer/Panel_niveau_4/Signe as RichTextLabel
		initialisation_composants_niveau_4(btn_valider_niveau_4,label_operation,label_signe)
		
		
		
		
	if numero_niveau == 5: # niveau 5
		print("Comparaisons - Niveau_5 - Chargement du niveau 5...")
		panel_chemin.visible = false
		panel_niveau_5.visible = true
		personnage_niveau_4.visible = false
		panel_niveau_5.visible = true
		generer_un_probleme(nombre_aleatoire_niveau_5)
		var btn_valider = $ColorRect/MarginContainer/Panel_niveau_5/btn_valider as Button
		btn_valider.button_down.connect(mise_en_place_niveau_5)


# cette fonction va nous permettre de générer une opération à réaliser de façon aléatoire
func generer_operation_aleatoire_niveau_1()->void:
	label_operation_a_resoudre.text = str(nombre_aleatoire_1_niveau_1)+" ... "+str(nombre_aleatoire_2_niveau_1)

# cette fonction du niveau 1 permet : d'attribuer un texte au checkbox
func attribuer_proposition_aleatoirement_au_checkBox_niveau_1()->void:
	
	checkBox_1.text = tableau_des_propositions[0]
	checkBox_2.text = tableau_des_propositions[1]
	checkBox_3.text = tableau_des_propositions[2]
	# vérification dans la console que les textes ont bien été attribués
	print("Texte des checkbox")
	print(checkBox_1.text)
	print(checkBox_2.text)
	print(checkBox_3.text)



# cette fonction va récupérer si la checkbox est coché ou non puis regarder si le résultat cochée est le bon
func verification_resultat_checkbox_niveau_1()->void:
	print("Comparaisons - Niveau 1 - Vérification du résultat")
	var resultat = nombre_aleatoire_1_niveau_1 - nombre_aleatoire_2_niveau_1
	var reponse_attendu
	var reponse_entree
	
	# si le resultat est négatif cela signifie que nombre1 est plus petit
	# si positif alors nombre 1 est plus grand
	# si 0 alors nombre 1 = nombre 2
	if resultat>0:
		reponse_attendu = tableau_des_propositions[0] # "est plus grand que"
	elif resultat<0:
		reponse_attendu = tableau_des_propositions[1] # "est plus petit que"
	elif resultat==0:
		reponse_attendu = tableau_des_propositions[2] # "est égal à"
	# on affiche la réponse dans la console pour vérifier que tout se passe bien
	print(resultat)
	print(reponse_attendu)
	
	# si la checkbox 1 était cochée alors...
	if checkBox_1.button_pressed:
		if checkBox_1.text == reponse_attendu:
			affichage_felicitation_niveau_1()
		else:
			print("Réponse fausse")
			erreur_niveau_1()
	# si la checkbox 2 était cochée alors...
	elif checkBox_2.button_pressed:
		if checkBox_2.text == reponse_attendu:
			affichage_felicitation_niveau_1()
		else:
			print("Réponse fausse")
			erreur_niveau_1()
	# si la checkbox 3 était cochée alors...
	elif checkBox_3.button_pressed:
		if checkBox_3.text == reponse_attendu:
			affichage_felicitation_niveau_1()
		else:
			print("Réponse fausse")
			erreur_niveau_1()


func erreur_niveau_1()->void:
	var texte = $ColorRect/MarginContainer/Panel_niveau_1/Recommencer as RichTextLabel
	texte.visible = true


# cette fonction nous permets d'afficher le panel de félicitation lorsque le niveau est réussi, de plus il affiche un bout d'image
func affichage_felicitation_niveau_1()->void:
	print("Comparaisons - Niveau 1 - Félicitations vous avez passé le niveau 1")
	btn_Niveau_2.visible = true
	var btn_suivant = $ColorRect/MarginContainer/Panel_bravo_niveau_1/Button_suivant as Button
	personnage_niveau_1.visible = false
	personnage_niveau_2.visible = true
	panel_niveau_1_bravo.visible = true
	
	# recupération du bout d'image
	var chemin = recompense[0][1][0]
	var texture = load(chemin)
	var morceau_image_1 = $ColorRect/MarginContainer/Panel_bravo_niveau_1/Bout_image_gagne
	morceau_image_1.texture = texture
	btn_suivant.button_down.connect(fin_definitive_niveau_1)

# on cache le niveau 1 et réaffichons le chemin
func fin_definitive_niveau_1()->void:
	print("Comparaisons - Niveau 1 - Fermeture définitive")
	panel_niveau_1_bravo.visible = false
	panel_niveau_1.visible = false
	panel_chemin.visible = true


# cette fonction est directement rattaché à une checkbox, lorsque un clic se produit elle devient "coché"
# Cela nous permet notamment d'avoir qu'une seule checkbox de cliqué en même temps
func on_checkbox_clicked(toogled_on, name, value):
	print (toogled_on, name, value)
	if !toogled_on:
		return
	
	for i in $ColorRect/MarginContainer/Panel_niveau_1/GridContainer.get_children():
		if (i.name != name):
			if i is CheckBox:
				i.button_pressed = false


# Lors du clique sur la validation de la réponse de l'utilisateur on va...
func btn_valider_niveau_2_click()-> void:
	# verifier que ca respecte bien ce qui est demandé, je n'ai pas de else car je gére directement tout dans la fonction
	if verification_resultat_entree_respecte_condition():
		# vérifier que le résultat est bon ou non
		if verification_resultat_niveau_2():
			btn_Niveau_4.visible = true
			personnage_niveau_2.visible = false
			personnage_niveau_3.visible = true
			panel_niveau_2_bravo.visible = true
			# on charge le second bout d'image
			var chemin = recompense[0][1][1]
			var texture = load(chemin)
			var morceau_image_2 = $ColorRect/MarginContainer/Panel_bravo_niveau_2/ColorRect/bout_image_gagne
			morceau_image_2.texture = texture
			var btn_suivant = $ColorRect/MarginContainer/Panel_bravo_niveau_2/ColorRect/Button_suivant as Button
			btn_suivant.button_down.connect(fin_definitive_niveau_2)

# on clos le niveau 2
func fin_definitive_niveau_2()-> void:
	panel_niveau_2_bravo.visible = false
	panel_niveau_2.visible = false
	panel_chemin.visible = true

# on vérifie que sur le niveau 2 l'utilsateur rentre bien "<" ou ">" ou "="
func verification_resultat_entree_respecte_condition()->bool:
	var bon_caractere = false # boolean permettant de savoir si le caractère entrée est bien < ou > ou =
	var texte = lineEdit_entree_du_resultat_niveau_2.text # recuperation de l'entree de l'utilisateur
	print("Le contenu de l'entrée est "+texte)
	if texte != "<" and texte != ">" and texte != "=": # si l'entree de l'utilisateur différente de < ou > ou =
		print("La saisie de caractére est éronnée")
		btn_valider_niveau2.text = "Attention à bien rentrer les bons caractères (< ou > ou =)" # on lui notifie à travers le bouton qu'il doit entrer < ou > ou = 
		lineEdit_entree_du_resultat_niveau_2.text = "" # on remet la zone d'entree vide afin qu'il puisse ressaisir
	else: # sinon (c'est que les bon caractère ont été entrée)
		print("Les caractères saisient sont bons")
		bon_caractere = true # on dit que c'est bon
		btn_valider_niveau2.text = "Valider ma réponse" # on remet le bon texte au bouton (au cas ou l'utilisateur se soit trompé avant)
	return bon_caractere # on retourne si c'est les bons caractère ou non


# on vérifie le résultat du niveau 2
func verification_resultat_niveau_2()->bool:
	var bonne_reponse = false
	# pour le calcul du resultat je fais une soutraction plutôt qu'une comparaison car cela me permet de connaître l'écart entre les deux nombres (on s'en servira plus tard)
	var resultat = nombre_aleatoire_1_niveau_2 - nombre_aleatoire_2_niveau_2
	var resultat_attendu
	var reponse_entree = lineEdit_entree_du_resultat_niveau_2.text
	
	if resultat > 0:
		resultat_attendu = ">"
	elif resultat < 0:
		resultat_attendu = "<"
	elif resultat == 0:
		resultat_attendu = "="
	else:
		print("Il y a un problème avec le résultat")
		
	if reponse_entree == resultat_attendu:
		bonne_reponse = true
	else:
		generer_explication_niveau_2(nombre_aleatoire_1_niveau_2, nombre_aleatoire_2_niveau_2, resultat)
	return bonne_reponse

# si il y a une erreur on génère une explication
func generer_explication_niveau_2(nombre1, nombre2, ecart_entre_nombre)->void:
	var ecart_nombre_positif = abs(ecart_entre_nombre)	# pour montrer à l'enfant l'écart entre deux nombres, nous lui montrons une valeur absolue de ce nombre car ils n'ont pas encore appris les chiffres négatifs, on le met dans une nouvelle variable car l'autre doit rester négative si elle l'est pour la comparaison
	if ecart_entre_nombre > 0:
		label_explication_niveau_2.text = "La bonne réponse est : > car "+str(nombre_aleatoire_1_niveau_2)+ " est plus grand "+str(nombre_aleatoire_2_niveau_2)+ " pour aller plus loin, l'écart est de "+str(ecart_entre_nombre)
	if ecart_entre_nombre < 0:
		label_explication_niveau_2.text = "La bonne réponse est : < car "+str(nombre_aleatoire_1_niveau_2)+ " est plus petit "+str(nombre_aleatoire_2_niveau_2)+ " pour aller plus loin, l'écart est de "+str(ecart_entre_nombre)
	if ecart_entre_nombre == 0:
		label_explication_niveau_2.text = "La bonne réponse est : = car "+str(nombre_aleatoire_1_niveau_2)+ " est égal à "+str(nombre_aleatoire_2_niveau_2)+ " pour aller plus loin, l'écart est de "+str(ecart_entre_nombre)





func generer_probleme_et_resoudre_niveau_3()->void:
	var label_chiffre = $ColorRect/MarginContainer/Panel_niveau_3/HBoxContainer/Chiffre_aleatoire as Label
	var label_resultat = $ColorRect/MarginContainer/Panel_niveau_3/HBoxContainer/Resultat as Label
	label_chiffre.text = str(chiffre_aleatoire_niveau3)
	label_resultat.text = str(resultat_aleatoire_niveau_3)
	var btn_validerr = $ColorRect/MarginContainer/Panel_niveau_3/btn_valider as Button
	var btn_est_plus_grand_que = $ColorRect/MarginContainer/Panel_niveau_3/VBoxContainer/HBoxContainer/btn_est_plus_grand_que as Button
	var btn_est_plus_petit_que = $ColorRect/MarginContainer/Panel_niveau_3/VBoxContainer/HBoxContainer/btn_est_plus_petit_que as Button
	var btn_est_egal_a = $ColorRect/MarginContainer/Panel_niveau_3/VBoxContainer/HBoxContainer2/btn_est_egal_a as Button
	
	btn_est_plus_grand_que.button_down.connect(btn_est_plus_grand_que_click)
	btn_est_plus_petit_que.button_down.connect(btn_est_plus_petit_que_click)
	btn_est_egal_a.button_down.connect(btn_est_egal_a_click)
	btn_validerr.button_down.connect(resoudre_probleme)

func resoudre_probleme()->void:
	var resultat = chiffre_aleatoire_niveau3 - resultat_aleatoire_niveau_3
	var resultat_attendu
	var label = $ColorRect/MarginContainer/Panel_niveau_3/HBoxContainer/A_completer as Label
	var resultat_entree = label.text
	
	if resultat > 0: # signifie que 1 er nombre supérieur au second donc on attend la réponse "est supérieur à"
		resultat_attendu = "est plus grand que"
	if resultat < 0:
		resultat_attendu = "est plus petit que"
	if resultat == 0:
		resultat_attendu = "est égal à"
	
	# comparer les résultats
	if resultat_attendu == resultat_entree:
		print("Bon résultat")
		panel_niveau_3_bravo.visible = true
		panel_niveau_3.visible = false
		# on charge le second bout d'image
		var chemin = recompense[0][1][1]
		var texture = load(chemin)
		var morceau_image_3 = $ColorRect/MarginContainer/Panel_bravo_niveau_3/bout_image_gagne
		morceau_image_3.texture = texture
		var btn_suivant = $ColorRect/MarginContainer/Panel_bravo_niveau_3/Button_suivant as Button
		btn_suivant.button_down.connect(btn_prochain_niveau_4_click)
	else:
		print("Mauvais résultat")



# passage du niveau 3 au niveau 4
func btn_prochain_niveau_4_click()->void:
	panel_niveau_3_bravo.visible = false
	panel_chemin.visible = true
	personnage_niveau_4.visible = true
	personnage_niveau_3.visible = false


func btn_est_plus_grand_que_click()->void:
	var label = $ColorRect/MarginContainer/Panel_niveau_3/HBoxContainer/A_completer as Label
	var btn = $ColorRect/MarginContainer/Panel_niveau_3/VBoxContainer/HBoxContainer/btn_est_plus_grand_que as Button
	label.text = btn.text


func btn_est_plus_petit_que_click()->void:
	var label = $ColorRect/MarginContainer/Panel_niveau_3/HBoxContainer/A_completer as Label
	var btn = $ColorRect/MarginContainer/Panel_niveau_3/VBoxContainer/HBoxContainer/btn_est_plus_petit_que as Button
	label.text = btn.text


func btn_est_egal_a_click()->void:
	var label = $ColorRect/MarginContainer/Panel_niveau_3/HBoxContainer/A_completer as Label
	var btn = $ColorRect/MarginContainer/Panel_niveau_3/VBoxContainer/HBoxContainer2/btn_est_egal_a as Button
	label.text = btn.text




# initialisation des composants du niveau 4 en vue de la préparation du niveau
func initialisation_composants_niveau_4(btn:Button, label_operation:RichTextLabel, label_signe:RichTextLabel)->void:
	# label qui va contenir le premier chiffre 
	# label qui va contenir le signe de l'opération
	var tableau_signes = ["<",">","="]
	var nombre_aleatoire_signe = randi_range(0,2)
	# on met à partir de 1 car cela nous permet d'éviter " 0 > ?", l'enfant ne connait pas les chiffres négatif, nous pourrions fixer en changeant la valeur aléatoire mais un enfant ne sait pas forcément manipuler les valeurs avec 0 alors il vaut mieux l'exclure même si " 1 > ? " reste possible, dans ce cas l'enfant met 0
	label_operation.text = str(randi_range(1,50))
	label_signe.text = tableau_signes[nombre_aleatoire_signe]
	btn.button_down.connect(verification_resultat_niveau_4)

# on vérifie le résultat du niveau
func verification_resultat_niveau_4()->void:
	var reponse_utilisateur = lineEdit_reponse_niveau_4.text
	var chiffre = label_operation.text
	var signe = label_signe.text
	var label_consigne = $ColorRect/MarginContainer/Panel_niveau_4/Label_consigne as RichTextLabel
	if signe == "<":
		if chiffre<reponse_utilisateur:
			passage_au_niveau_4()
			btn_Niveau_5.visible = true
		else:
			pas_passage_niveau_X(4)
	elif signe == ">":
		if chiffre>reponse_utilisateur:
			passage_au_niveau_4()
			btn_Niveau_5.visible = true
		else:
			pas_passage_niveau_X(4)
	elif signe =="=":
		if chiffre==reponse_utilisateur:
			passage_au_niveau_4()
			btn_Niveau_5.visible = true
		else:
			pas_passage_niveau_X(4)


# on affiche la panel de félicitation pour le niveau 4
func passage_au_niveau_4()->void:
	print("Comparaisons - Niveau 4 - Bonne réponse")
	panel_niveau_4_bravo.visible = true
	var chemin = recompense[0][1][2]
	var texture = load(chemin)
	var morceau_image_4 = $ColorRect/MarginContainer/Panel_bravo_niveau_4/ColorRect/bout_image_gagne
	morceau_image_4.texture = texture
	var btn_suivant = $ColorRect/MarginContainer/Panel_bravo_niveau_4/ColorRect/Button_suivant as Button
	btn_suivant.button_down.connect(fin_definitive_niveau_4)

func fin_definitive_niveau_4()->void:
	panel_niveau_4_bravo.visible = false
	panel_niveau_4.visible = false
	panel_chemin.visible = true
	personnage_niveau_5.visible = true
	personnage_niveau_4.visible = false

func pas_passage_niveau_X(numero_niveau:int)->void:
	print("Comparaisons - Niveau  "+str(numero_niveau)+" - Mauvaise réponse")
	var texte = $ColorRect/MarginContainer/Panel_niveau_4/Recommencer as RichTextLabel
	texte.visible = true


# pour le niveau 5 je génère un problème
func generer_un_probleme(nombre_aleatoire:int)->void:
	# tableau avec différents problèmes
	var tableau_probleme = [
		"[center][color=#0000FF]T u  a s   r a m a s s é   4   p o m m e s   e t   t o n   a m i   e n  a  r a m a s s é  2. C o m b i e n   e n   a s - t u   d e   p l u s   q u e   t o n   a m i  ? Écris le nombre de pommes que tu as en plus.[/color][center]",
		"[center][color=#0000FF]R e g a r d e   c e s   d e u x   n o m b r e s : 7  e t  9. L e q u e l   e s t   l e   p l u s    g r a n d ? R e n d r e   l e    c h i f f r e    l e   p l u s    g r a n d   p o u r    l e s   c o m p a r e r.[/color][center]",
		"[center][color=#0000FF]J ' a i   5   b o n b o n s,   m o n   a m i s   e n   a   2,  j e   f a i s   t o m b e r   2   b o n b o n s    j e   p e r d   d o n c   2   b o n b o n s ,   m o n   a m i   r a m a s s e   l e s   2   b o n b o n s   i l   g a g n e   d e u x   b o n b o n s .   C o m b i e n   a v o u s   n o u s   d e   b o n b o n s   d ' é c a r t   ?[/color][center]"
	]
	var consigne = $ColorRect/MarginContainer/Panel_niveau_5/RichTextLabel_consigne as RichTextLabel
	consigne.text = tableau_probleme[nombre_aleatoire]


# mise en place du niveau 5
func mise_en_place_niveau_5()->void:
	var nombre_aleatoire = nombre_aleatoire_niveau_5
	var bonne_réponse
	var reponse_entree = $ColorRect/MarginContainer/Panel_niveau_5/LineEdit_reponse.text
	var btn_valider = $ColorRect/MarginContainer/Panel_niveau_5/btn_valider as Button
	if nombre_aleatoire == 0:
		bonne_réponse = 2
		if str(bonne_réponse) == reponse_entree:
			print("Bonne réponse")
			btn_valider.button_down.connect(verification_niveau_5)
		else:
			print("mauvaise réponse")
			erreur_niveau_5()
	elif nombre_aleatoire == 1:
		bonne_réponse = 9
		if str(bonne_réponse) == reponse_entree:
			print("Bonne réponse")
			btn_valider.button_down.connect(verification_niveau_5)
		else:
			print("mauvaise réponse")
			erreur_niveau_5()
	elif  nombre_aleatoire == 2:
		bonne_réponse = 1
		if str(bonne_réponse) == reponse_entree:
			print("Bonne réponse")
			btn_valider.button_down.connect(verification_niveau_5)
		else:
			print("mauvaise réponse")
			erreur_niveau_5()


func erreur_niveau_5()->void:
	var texte = $ColorRect/MarginContainer/Panel_niveau_5/Recommencer as RichTextLabel
	texte.visible = true


# vérification de la réponse de l'utilisateur pour le niveau 5
func verification_niveau_5()->void:
	panel_niveau_5_bravo.visible = true
	var chemin_image = recompense[0][0]
	var texture = load(chemin_image)
	var image_complete = $ColorRect/MarginContainer/Panel_bravo_niveau_5/ColorRect/image_complete as TextureRect
	image_complete.texture = texture
	personnage_niveau_5.visible = false
	image_coffre_fermer.visible = false
	image_coffre_ouvert.visible = true
	var btn_suivant = $ColorRect/MarginContainer/Panel_bravo_niveau_5/ColorRect/Button_suivant as Button
	btn_suivant.button_down.connect(fin_definitive_niveau_5)

# fermeture du niveau 5
func fin_definitive_niveau_5()->void:
	panel_niveau_5_bravo.visible = false
	panel_niveau_5.visible = false
	panel_chemin.visible = true
