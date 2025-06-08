extends Control

#--------------------------------------------------------------------------------------------------
#                                       ATTRIBUTS
#--------------------------------------------------------------------------------------------------
# Récupérer les boutons du premier panel de chemin
@onready var btnCours = $Marges/PanelAccueil/btnCours as Button

# Récupérer les boutons du deuxième panel de chemin
@onready var btnCoursChemin1 = $Marges/PanelCheminCoursValide/btnCours as Button
@onready var btnNiveau1 = $Marges/PanelCheminCoursValide/btnNiveau1 as Button

# Récupérer les composants du panel de cours
@onready var btnFinLecture = $Marges/PanelCours/btnFinLecture as Button

# Récuperer les composants du panel contenant le niveau 1
@onready var nbAleatoire1Niveau1 = $Marges/PanelNiveau1/Conteneur/ConteneurEnonce/NombreAleatoire as RichTextLabel
@onready var nbAleatoire2Niveau1 = $Marges/PanelNiveau1/Conteneur/ConteneurEnonce/NombreAleatoire2 as RichTextLabel
@onready var Proposition1 = $Marges/PanelNiveau1/Conteneur/ConteneurProposition/Conteneur/Proposition1 as CheckBox
@onready var Proposition2 = $Marges/PanelNiveau1/Conteneur/ConteneurProposition/Conteneur/Proposition2 as CheckBox
@onready var Proposition3 = $Marges/PanelNiveau1/Conteneur/ConteneurProposition/Conteneur2/Proposition3 as CheckBox
@onready var Proposition4 = $Marges/PanelNiveau1/Conteneur/ConteneurProposition/Conteneur2/Proposition4 as CheckBox
var propositions = []
@onready var btnValiderNiveau1 = $Marges/PanelNiveau1/Conteneur/btnValider as Button

# Récupérer les composants du panel de mauvaise réponse du niveau 1
@onready var explicationNiveau1 = $Marges/PanelMauvaiseReponseNiveau1/VBoxContainer/Explication as RichTextLabel
@onready var btnRetenterNiveau1 = $Marges/PanelMauvaiseReponseNiveau1/VBoxContainer/HBoxContainer/btnRetenter as Button
@onready var btnCheminNiveau1 = $Marges/PanelMauvaiseReponseNiveau1/VBoxContainer/HBoxContainer/btnChemin as Button

# Récupérer les composants du panel de bonne réponse du niveau 1
@onready var btnSuivantNiveau1 = $Marges/PanelBonneReponseNiveau1/VBoxContainer/HBoxContainer/btnSuivant as Button
@onready var morceauImage1 = $Marges/PanelBonneReponseNiveau1/VBoxContainer/ConteneurImage/morceauImage as TextureRect

# Récupérer les composants du panel du chemin une fois le niveau 1 validé
@onready var btnCoursCheminNiveau1Valide = $Marges/PanelCheminNiveau1Valide/btnCours as Button
@onready var btnNiveau1CheminNiveau1Valide = $Marges/PanelCheminNiveau1Valide/btnNiveau1 as Button
@onready var btnNiveau2 = $Marges/PanelCheminNiveau1Valide/btnNiveau2 as Button

# Récupérer les composants du panel du niveau 2.
@onready var nbAleatoire1Niveau2 = $Marges/PanelNiveau2/VBoxContainer/ConteneurEnonce/nbAleatoire1 as RichTextLabel
@onready var nbAleatoire2Niveau2 = $Marges/PanelNiveau2/VBoxContainer/ConteneurEnonce/nbAleatoire2 as RichTextLabel
@onready var reponseUtilisateurNiveau2 = $Marges/PanelNiveau2/VBoxContainer/ConteneurEnonce/ReponseSaisit as TextEdit
@onready var btnValiderNiveau2 = $Marges/PanelNiveau2/VBoxContainer/btnValider as Button

# Récupérer les composants du panel de mauvaise réponse du niveau 2
@onready var explicationNiveau2 = $Marges/PanelMauvaiseReponseNiveau2/VBoxContainer/Explication as RichTextLabel
@onready var btnRetenterNiveau2 = $Marges/PanelMauvaiseReponseNiveau2/VBoxContainer/HBoxContainer/btnRetenter as Button
@onready var btnCheminNiveau2 = $Marges/PanelMauvaiseReponseNiveau2/VBoxContainer/HBoxContainer/btnChemin as Button

# Récupérer les composants du panel de bonne réponse du niveau 2
@onready var btnSuivantNiveau2 = $Marges/PanelBonneReponseNiveau2/VBoxContainer/HBoxContainer/btnSuivant as Button
@onready var morceauImage2 = $Marges/PanelBonneReponseNiveau2/VBoxContainer/ConteneurImage/morceauImage as TextureRect

# Récupérer les composants du panel du chemin une fois le niveau 2 validé
@onready var btnCoursCheminNiveau2Valide = $Marges/PanelCheminNiveau2Valide/btnCours as Button
@onready var btnNiveau1CheminNiveau2Valide = $Marges/PanelCheminNiveau2Valide/btnNiveau1 as Button
@onready var btnNiveau2CheminNiveau2Valide = $Marges/PanelCheminNiveau2Valide/btnNiveau2 as Button
@onready var btnNiveau3 = $Marges/PanelCheminNiveau2Valide/btnNiveau3 as Button

# Récupérer les composants du panel du niveau 3.
@onready var nbAleatoire1Niveau3 = $Marges/PanelNiveau3/VBoxContainer/Enonce/nbAleatoire1 as RichTextLabel
@onready var nbAleatoire2Niveau3 = $Marges/PanelNiveau3/VBoxContainer/Enonce/nbAleatoireResultat as RichTextLabel
@onready var proposition1 = $Marges/PanelNiveau3/VBoxContainer/Propositions/Conteneur/proposition1 as Button
@onready var proposition2 = $Marges/PanelNiveau3/VBoxContainer/Propositions/Conteneur/proposition2 as Button
@onready var proposition3 = $Marges/PanelNiveau3/VBoxContainer/Propositions/Conteneur2/proposition3 as Button
@onready var proposition4 = $Marges/PanelNiveau3/VBoxContainer/Propositions/Conteneur2/proposition4 as Button
var propositionsNiveau3 = []
@onready var reponseUtilisateurNiveau3 = $Marges/PanelNiveau3/VBoxContainer/Enonce/ReponseUtilisateur as Label
@onready var btnValiderNiveau3 = $Marges/PanelNiveau3/VBoxContainer/btnValider as Button

# Récupérer les composants du panel de mauvaise réponse du niveau 3
@onready var explicationNiveau3 = $Marges/PanelMauvaiseReponseNiveau3/VBoxContainer/Explication as RichTextLabel
@onready var btnRetenterNiveau3 = $Marges/PanelMauvaiseReponseNiveau3/VBoxContainer/HBoxContainer/btnRetenter as Button
@onready var btnCheminNiveau3 = $Marges/PanelMauvaiseReponseNiveau3/VBoxContainer/HBoxContainer/btnChemin as Button

# Récupérer les composants du panel de bonne réponse du niveau 3
@onready var btnSuivantNiveau3 = $Marges/PanelBonneReponseNiveau3/VBoxContainer/HBoxContainer/btnSuivant as Button
@onready var morceauImage3 = $Marges/PanelBonneReponseNiveau3/VBoxContainer/ConteneurImage/morceauImage as TextureRect

# Récupérer les composants du panel du chemin une fois le niveau 3 validé
@onready var btnCoursCheminNiveau3Valide = $Marges/PanelCheminNiveau3Valide/btnCours as Button
@onready var btnNiveau1CheminNiveau3Valide = $Marges/PanelCheminNiveau3Valide/btnNiveau1 as Button
@onready var btnNiveau2CheminNiveau3Valide = $Marges/PanelCheminNiveau3Valide/btnNiveau2 as Button
@onready var btnNiveau3CheminNiveau3Valide = $Marges/PanelCheminNiveau3Valide/btnNiveau3 as Button
@onready var btnNiveau4 = $Marges/PanelCheminNiveau3Valide/btnNiveau4 as Button

# Récupérer les composants du panel du niveau 4
@onready var nbAleatoire1Niveau4 = $Marges/PanelNiveau4/Conteneur/ConteneurEnonce/NombreAleatoire as RichTextLabel
@onready var nbAleatoire2Niveau4 = $Marges/PanelNiveau4/Conteneur/ConteneurEnonce/NombreAleatoire2 as RichTextLabel
@onready var reponseUtilisateurNiveau4 = $Marges/PanelNiveau4/Conteneur/ConteneurEnonce/ReponseSaisit as TextEdit
@onready var btnValiderNiveau4 = $Marges/PanelNiveau4/Conteneur/btnValider as Button

# Récupérer les composants du panel de mauvaise réponse du niveau 4
@onready var explicationNiveau4 = $Marges/PanelMauvaiseReponseNiveau4/VBoxContainer/Explication as RichTextLabel
@onready var btnRetenterNiveau4 = $Marges/PanelMauvaiseReponseNiveau4/VBoxContainer/HBoxContainer/btnRetenter as Button
@onready var btnCheminNiveau4 = $Marges/PanelMauvaiseReponseNiveau4/VBoxContainer/HBoxContainer/btnChemin as Button

# Récupérer les composants du panel de bonne réponse du niveau 4
@onready var btnSuivantNiveau4 = $Marges/PanelBonneReponseNiveau4/VBoxContainer/HBoxContainer/btnSuivant as Button
@onready var morceauImage4 = $Marges/PanelBonneReponseNiveau4/VBoxContainer/ConteneurImage/morceauImage as TextureRect

# Récupérer les composants du panel du chemin une fois le niveau 4 validé
@onready var btnCoursCheminNiveau4Valide = $Marges/PanelCheminNiveau4Valide/btnCours as Button
@onready var btnNiveau1CheminNiveau4Valide = $Marges/PanelCheminNiveau4Valide/btnNiveau1 as Button
@onready var btnNiveau2CheminNiveau4Valide = $Marges/PanelCheminNiveau4Valide/btnNiveau2 as Button
@onready var btnNiveau3CheminNiveau4Valide = $Marges/PanelCheminNiveau4Valide/btnNiveau3 as Button
@onready var btnNiveau4CheminNiveau4Valide = $Marges/PanelCheminNiveau4Valide/btnNiveau4 as Button
@onready var btnNiveau5= $Marges/PanelCheminNiveau4Valide/btnNiveau5 as Button

# Récupérer les composants du panel du niveau 5
@onready var enonceNiveau5 = $Marges/PanelNiveau5/Conteneur/Enonce as RichTextLabel
@onready var reponseUtilisateurNiveau5 = $Marges/PanelNiveau5/Conteneur/reponseUtilisateur as TextEdit
@onready var btnValiderNiveau5 = $Marges/PanelNiveau5/Conteneur/btnValider as Button
@onready var problemes = []
@onready var nbProbleme

# Récupérer les composants du panel de mauvaise réponse du niveau 5
@onready var explicationNiveau5 = $Marges/PanelMauvaiseReponseNiveau5/VBoxContainer/Explication as RichTextLabel
@onready var btnRetenterNiveau5 = $Marges/PanelMauvaiseReponseNiveau5/VBoxContainer/HBoxContainer/btnRetenter as Button
@onready var btnCheminNiveau5 = $Marges/PanelMauvaiseReponseNiveau5/VBoxContainer/HBoxContainer/btnChemin as Button

# Récupérer les éléménts du panel de fin de parcours
@onready var btnCoffreFerme = $Marges/PanelFinDeParcours/VBoxContainer/HBoxContainer/btnCoffreFerme as Button

# Récupérer les éléments du panel d'attribution de récompense
@onready var imageRecompense = $Marges/PanelRecompenses/VBoxContainer/HBoxContainer/ConteneurImage/recompense as TextureRect
@onready var btnCheminRecompense = $Marges/PanelRecompenses/VBoxContainer/btnChemin as Button

# Récupérer les éléments du panel de fin du chemin
@onready var btnCoursCheminTermine = $Marges/PanelCheminTermine/btnCours as Button
@onready var btnNiveau1CheminTermine = $Marges/PanelCheminTermine/btnNiveau1 as Button
@onready var btnNiveau2CheminTermine = $Marges/PanelCheminTermine/btnNiveau2 as Button
@onready var btnNiveau3CheminTermine = $Marges/PanelCheminTermine/btnNiveau3 as Button
@onready var btnNiveau4CheminTermine= $Marges/PanelCheminTermine/btnNiveau4 as Button
@onready var btnNiveau5CheminTermine = $Marges/PanelCheminTermine/btnNiveau5 as Button
@onready var btnRecommencer = $Marges/PanelCheminTermine/btnRecommencer as Button

# Récupérer les panels
@onready var panelAccueil = $Marges/PanelAccueil as Panel
@onready var panelCours = $Marges/PanelCours as Panel
@onready var panelCheminCoursValide = $Marges/PanelCheminCoursValide as Panel
@onready var panelNiveau1 = $Marges/PanelNiveau1 as Panel
@onready var panelMauvaiseReponseNiveau1 = $Marges/PanelMauvaiseReponseNiveau1 as Panel
@onready var panelBonneReponseNiveau1 = $Marges/PanelBonneReponseNiveau1 as Panel
@onready var panelCheminNiveau1Valide = $Marges/PanelCheminNiveau1Valide as Panel
@onready var panelNiveau2 = $Marges/PanelNiveau2 as Panel
@onready var panelMauvaiseReponseNiveau2 = $Marges/PanelMauvaiseReponseNiveau2 as Panel
@onready var panelBonneReponseNiveau2 = $Marges/PanelBonneReponseNiveau2 as Panel
@onready var panelCheminNiveau2Valide = $Marges/PanelCheminNiveau2Valide as Panel
@onready var panelNiveau3 = $Marges/PanelNiveau3 as Panel
@onready var panelMauvaiseReponseNiveau3 = $Marges/PanelMauvaiseReponseNiveau3 as Panel
@onready var panelBonneReponseNiveau3 = $Marges/PanelBonneReponseNiveau3 as Panel
@onready var panelCheminNiveau3Valide = $Marges/PanelCheminNiveau3Valide as Panel
@onready var panelNiveau4 = $Marges/PanelNiveau4 as Panel
@onready var panelMauvaiseReponseNiveau4 = $Marges/PanelMauvaiseReponseNiveau4 as Panel
@onready var panelBonneReponseNiveau4 = $Marges/PanelBonneReponseNiveau4 as Panel
@onready var panelCheminNiveau4Valide = $Marges/PanelCheminNiveau4Valide as Panel
@onready var panelNiveau5 = $Marges/PanelNiveau5 as Panel
@onready var panelMauvaiseReponseNiveau5 = $Marges/PanelMauvaiseReponseNiveau5 as Panel
@onready var panelFinDeParcours = $Marges/PanelFinDeParcours as Panel
@onready var panelRecompense = $Marges/PanelRecompenses as Panel
@onready var panelCheminTermine = $Marges/PanelCheminTermine as Panel

# Créer un générateur de nombre aléatoire
var generateurAleatoire = RandomNumberGenerator.new() 

# Importer la classe Images
var GestionImages = preload("res://Scripts/mesImages.gd")
# Créer une instance de la classe GestionImages
var images = GestionImages.new()

# Créer une variable stockant l'image de récompense
var recompense

# Créer une variable stockant si le parcours est finit
var chapitreSoustractionFinit

#--------------------------------------------------------------------------------------------------
#                                       FONCTIONS
#--------------------------------------------------------------------------------------------------
# APPELER LORDQUE LE NOEUDS ENTRE DANS L'ARBRE DE SCENE POUR LA PREMIERE FOIS.
func _ready():
	# Appeler la fonction de gestion des cliques sur la scène.
	gestion_clic_bouton()
	# Créer une liste avec les propositions.
	propositions = [Proposition1, Proposition2, Proposition3, Proposition4]
	# Créer une liste avec les propositions pour le niveau 3.
	propositionsNiveau3 = [proposition1, proposition2, proposition3, proposition4]
	var probleme1 = ["[color=#0E00FF]P i e r r e  a v a i t  8  b o n b o n s . [/color][color=#137500] I l  e n  m a n g é  3 .[/color]
	[color=#FF0000]C o m b i e n  d e  b o n b o n s  l u i  r e s t e - t - i l  m a i n t e n a n t ?[/color]", 5]
	var probleme2 = ["[color=#0E00FF]A l i c e  a  r a m a s s é  1 2  p o m m e s  d a n s  l e  j a r d i n . [/color][color=#137500]  E l l e  e n  a  d o n n é  5  à  s o n  a m i . [/color]
	[color=#FF0000]C o m b i e n  d e  p o m m e s  l u i  r e s t e - t - i l  m a i n t e n a n t ?[/color]", 7]
	var probleme3 = ["[color=#0E00FF]D a n s  u n  p a n i e r ,  i l  y  a v a i t  2 0  c r a y o n s . [/color][color=#137500] S a r a h  e n  a  p r i s  9  p o u r  d e s s i n e r . [/color]
	[color=#FF0000]C o m b i e n  d e  c r a y o n s  r e s t e n t  d a n s  l e  p a n i e r  m a i n t e n a n t ?[/color]", 11]
	var probleme4 = ["[color=#0E00FF]M a r i e  a  p l a n t é  2 5  f l e u r s  d a n s  s o n  j a r d i n . [/color][color=#137500] L e  v e n t  f o r t  e n  a  e m p o r t é  1 3 . [/color][color=#FF0000] E n s u i t e ,  e l l e  a  d o n n é  5  f l e u r s  à  s a  v o i s i n e .[/color]
	[color=#0E00FF]C o m b i e n  d e  f l e u r s  l u i  r e s t e - t - i l  m a i n t e n a n t  d a n s  s o n  j a r d i n ?[/color]", 7]
	var probleme5 = ["[color=#0E00FF]E m m a  a  a c h e t é  u n e  b o î t e  d e  5 0  c r a y  o n s  d e  c o u l e u r . [/color][color=#137500] E l l e  e n  a  d o n n é  1 8  à  s a  p e t i  t e  s œ u r . [/color][color=#FF0000] E n s u  i t e ,  e l l e  a  u t i l i s é  1 0  c r a y o n s  p o u r  c o l o r i e r  u n  g r a n d   d e s s i n . [/color][color=#0E00FF] F i n a l e m e n t ,  e l l e  a  p r ê t é  5  c r a y o n s  à  s o n  a m i  L u c a s .[/color]
	[color=#137500]C o m b i e n  d e  c r a y o n s  d e  c o u l e u r  E m m a  a - t - e l l e  m a i n t e n a n t ?[/color]", 17]
	# Créer une liste de problème.
	problemes = [ probleme1, probleme2, probleme3, probleme4, probleme5]
	# Trouver une image.
	recompense = images.selectionner_image()




# FONCTION QUI GERE LES CLIQUES SUR LES BOUTONS. 
func gestion_clic_bouton()-> void:
	# Quand le bouton du cours est cliqué, on appelle la fonction btnCours_clique.
	btnCours.button_down.connect(btnCours_clique)
	# Quand le bouton du cours est cliqué, on appelle la fonction btnCoursChemin1_clique.
	btnCoursChemin1.button_down.connect(btnCoursChemin1_clique)
	# Quand le bouton du cours est cliqué, on appelle la fonction btnCoursCheminNiveau1Valide_clique.
	btnCoursCheminNiveau1Valide.button_down.connect(btnCoursCheminNiveau1Valide_clique)
	# Quand le bouton du cours est cliqué, on appelle la fonction btnCoursCheminNiveau2Valide_clique.
	btnCoursCheminNiveau2Valide.button_down.connect(btnCoursCheminNiveau2Valide_clique)
	# Quand le bouton du cours est cliqué, on appelle la fonction btnCoursCheminNiveau3Valide_clique.
	btnCoursCheminNiveau3Valide.button_down.connect(btnCoursCheminNiveau3Valide_clique)
	# Quand le bouton du cours est cliqué, on appelle la fonction btnCoursCheminNiveau4Valide_clique.
	btnCoursCheminNiveau4Valide.button_down.connect(btnCoursCheminNiveau4Valide_clique)
	# Quand le bouton du cours est cliqué, on appelle la fonction btnCoursCheminTermine_clique.
	btnCoursCheminTermine.button_down.connect(btnCoursCheminTermine_clique)
	# Quand le bouton de fin de lecture du cours est cliqué, on appelle la fonction btnFinLecture_clique.
	btnFinLecture.button_down.connect(btnFinLecture_clique)
	# Quand le bouton de niveau 1 est cliqué, on appelle la fonction btnNiveau1_clique.
	btnNiveau1.button_down.connect(btnNiveau1_clique)
	# Quand le bouton de niveau 1 est cliqué, on appelle la fonction btnNiveau1CheminNiveau1Valide_clique.
	btnNiveau1CheminNiveau1Valide.button_down.connect(btnNiveau1CheminNiveau1Valide_clique)
	# Quand le bouton de niveau 1 est cliqué, on appelle la fonction btnNiveau1CheminNiveau2Valide_clique.
	btnNiveau1CheminNiveau2Valide.button_down.connect(btnNiveau1CheminNiveau2Valide_clique)
	# Quand le bouton de niveau 1 est cliqué, on appelle la fonction btnNiveau1CheminNiveau3Valide_clique.
	btnNiveau1CheminNiveau3Valide.button_down.connect(btnNiveau1CheminNiveau3Valide_clique)
	# Quand le bouton de niveau 1 est cliqué, on appelle la fonction btnNiveau1CheminNiveau4Valide_clique.
	btnNiveau1CheminNiveau4Valide.button_down.connect(btnNiveau1CheminNiveau4Valide_clique)
	# Quand le bouton de niveau 1 est cliqué, on appelle la fonction btnNiveau1CheminTermine_clique.
	btnNiveau1CheminTermine.button_down.connect(btnNiveau1CheminTermine_clique)
	# Quand le bouton de validation du niveau 1 du cours est cliqué, on appelle la fonction btnValiderNiveau1_clique.
	btnValiderNiveau1.button_down.connect(btnValiderNiveau1_clique)
	# Quand le bouton pour réessayer le niveau 1 du cours est cliqué, on appelle la fonction btnRetenterNiveau1_clique.
	btnRetenterNiveau1.button_down.connect(btnRetenterNiveau1_clique)
	# Quand le bouton pour revenir au chemin est cliqué, on appelle la fonction btnCheminNiveau1_clique.
	btnCheminNiveau1.button_down.connect(btnCheminNiveau1_clique)
	# Quand le bouton pour poursuivre le parcours est cliqué, on appelle la fonction btnSuivantNiveau1_clique.
	btnSuivantNiveau1.button_down.connect(btnSuivantNiveau1_clique)
	# Quand le bouton pour le niveau 2 est cliqué, on appelle la fonction btnNiveau2_clique.
	btnNiveau2.button_down.connect(btnNiveau2_clique)
	# Quand le bouton pour le niveau 2 est cliqué, on appelle la fonction btnNiveau2CheminNiveau2Valide_clique.
	btnNiveau2CheminNiveau2Valide.button_down.connect(btnNiveau2CheminNiveau2Valide_clique)
	# Quand le bouton pour le niveau 2 est cliqué, on appelle la fonction btnNiveau2CheminNiveau3Valide_clique.
	btnNiveau2CheminNiveau3Valide.button_down.connect(btnNiveau2CheminNiveau3Valide_clique)
	# Quand le bouton pour le niveau 2 est cliqué, on appelle la fonction btnNiveau2CheminNiveau4Valide_clique.
	btnNiveau2CheminNiveau4Valide.button_down.connect(btnNiveau2CheminNiveau4Valide_clique)
	# Quand le bouton pour le niveau 2 est cliqué, on appelle la fonction btnNiveau2CheminTermine_clique.
	btnNiveau2CheminTermine.button_down.connect(btnNiveau2CheminTermine_clique)
	# Quand le bouton pour valider les réponse du niveau 2 est cliqué, on appelle la fonction btnValiderNiveau2_clique.
	btnValiderNiveau2.button_down.connect(btnValiderNiveau2_clique)
	# Quand le bouton pour réessayer le niveau 2 du cours est cliqué, on appelle la fonction btnRetenterNiveau2_clique.
	btnRetenterNiveau2.button_down.connect(btnRetenterNiveau2_clique)
	# Quand le bouton pour revenir au chemin est cliqué, on appelle la fonction btnCheminNiveau2_clique.
	btnCheminNiveau2.button_down.connect(btnCheminNiveau2_clique)
	# Quand le bouton pour poursuivre le parcours est cliqué, on appelle la fonction btnSuivantNiveau2_clique.
	btnSuivantNiveau2.button_down.connect(btnSuivantNiveau2_clique)
	# Quand le bouton pour le niveau 3 est cliqué, on appelle la fonction btnNiveau3_clique.
	btnNiveau3.button_down.connect(btnNiveau3_clique)
	# Quand le bouton pour le niveau 3 est cliqué, on appelle la fonction btnNiveau3Cheminniveau3Valide_clique.
	btnNiveau3CheminNiveau3Valide.button_down.connect(btnNiveau3CheminNiveau3Valide_clique)
	# Quand le bouton pour le niveau 3 est cliqué, on appelle la fonction btnNiveau3CheminNiveau4Valide_clique.
	btnNiveau3CheminNiveau4Valide.button_down.connect(btnNiveau3CheminNiveau4Valide_clique)
	# Quand le bouton pour le niveau 3 est cliqué, on appelle la fonction btnNiveau3CheminTermine_clique.
	btnNiveau3CheminTermine.button_down.connect(btnNiveau3CheminTermine_clique)
	# Quand le bouton pour valider les réponse du niveau 3 est cliqué, on appelle la fonction btnValiderNiveau2_clique.
	btnValiderNiveau3.button_down.connect(btnValiderNiveau3_clique)
	# Quand le bouton pour réessayer le niveau 3 du cours est cliqué, on appelle la fonction btnRetenterNiveau2_clique.
	btnRetenterNiveau3.button_down.connect(btnRetenterNiveau3_clique)
	# Quand le bouton pour revenir au chemin est cliqué, on appelle la fonction btnCheminNiveau2_clique.
	btnCheminNiveau3.button_down.connect(btnCheminNiveau3_clique)
	# Quand le bouton pour poursuivre le parcours est cliqué, on appelle la fonction btnSuivantNiveau2_clique.
	btnSuivantNiveau3.button_down.connect(btnSuivantNiveau3_clique)
	# Quand le bouton pour le niveau 4 est cliqué, on appelle la fonction btnNiveau4_clique.
	btnNiveau4.button_down.connect(btnNiveau4_clique)
	# Quand le bouton pour le niveau 4 est cliqué, on appelle la fonction btnNiveau4CheminNiveau4Valide_clique.
	btnNiveau4CheminNiveau4Valide.button_down.connect(btnNiveau4CheminNiveau4Valide_clique)
	# Quand le bouton pour le niveau 4 est cliqué, on appelle la fonction btnNiveau4CheminTermine_clique.
	btnNiveau4CheminTermine.button_down.connect(btnNiveau4CheminTermine_clique)
	# Quand le bouton pour valider les réponse du niveau 4 est cliqué, on appelle la fonction btnValiderNiveau4_clique.
	btnValiderNiveau4.button_down.connect(btnValiderNiveau4_clique)
	# Quand le bouton pour réessayer le niveau 4 du cours est cliqué, on appelle la fonction btnRetenterNiveau4_clique.
	btnRetenterNiveau4.button_down.connect(btnRetenterNiveau4_clique)
	# Quand le bouton pour revenir au chemin est cliqué, on appelle la fonction btnCheminNiveau4_clique.
	btnCheminNiveau4.button_down.connect(btnCheminNiveau4_clique)
	# Quand le bouton pour poursuivre le parcours est cliqué, on appelle la fonction btnSuivantNiveau4_clique.
	btnSuivantNiveau4.button_down.connect(btnSuivantNiveau4_clique)
	# Quand le bouton pour le niveau 5 est cliqué, on appelle la fonction btnNiveau5_clique.
	btnNiveau5.button_down.connect(btnNiveau5_clique)
	# Quand le bouton pour le niveau 5 est cliqué, on appelle la fonction btnNiveau5CheminTermine_clique.
	btnNiveau5CheminTermine.button_down.connect(btnNiveau5CheminTermine_clique)
	# Quand le bouton pour valider les réponse du niveau 5 est cliqué, on appelle la fonction btnValiderNiveau5_clique.
	btnValiderNiveau5.button_down.connect(btnValiderNiveau5_clique)
	# Quand le bouton pour réessayer le niveau 5 du cours est cliqué, on appelle la fonction btnRetenterNiveau5_clique.
	btnRetenterNiveau5.button_down.connect(btnRetenterNiveau5_clique)
	# Quand le bouton pour revenir au chemin est cliqué, on appelle la fonction btnCheminNiveau5_clique.
	btnCheminNiveau5.button_down.connect(btnCheminNiveau5_clique)
	# Quand le bouton pour ouvrir le coffre est cliqué, on appelle la fonction btnSCoffreFerme_clique.
	btnCoffreFerme.button_down.connect(btnCoffreFerme_clique)
	# Quand le bouton pour revenir au chemin à la fin du parcours, on appelle la fonction btnCheminRecompense_clique.
	btnCheminRecompense.button_down.connect(btnCheminRecompense_clique)
	# Quand le bouton pour recommencer le parcours, on appelle la fonction btnRecommencer_clique.
	btnRecommencer.button_down.connect(btnRecommencer_clique)
	# Quand le bouton pour sélectionné la première proposition du niveau 3 est cliqué, on appelle la fonction proposition1_clique.
	proposition1.button_down.connect(proposition1_clique)
	# Quand le bouton pour sélectionné la deuxième proposition du niveau 3 est cliqué, on appelle la fonction proposition2_clique.
	proposition2.button_down.connect(proposition2_clique)
	# Quand le bouton pour sélectionné la troisième proposition du niveau 3 est cliqué, on appelle la fonction proposition3_clique.
	proposition3.button_down.connect(proposition3_clique)
	# Quand le bouton pour sélectionné la quatrième proposition du niveau 3 est cliqué, on appelle la fonction proposition4_clique.
	proposition4.button_down.connect(proposition4_clique)




# FONCTION QUI AFFICHE LE COURS.
func btnCours_clique()->void:
	# Changer de panel.
	panelAccueil.visible = false
	panelCours.visible = true

# FONCTION QUI AFFICHE LE COURS.
func btnCoursChemin1_clique()->void:
	# Changer de panel.
	panelCheminCoursValide.visible = false
	panelCours.visible = true

# FONCTION QUI AFFICHE LE COURS.
func btnCoursCheminNiveau1Valide_clique()->void:
	# Changer de panel.
	panelCheminNiveau1Valide.visible = false
	panelCours.visible = true

# FONCTION QUI AFFICHE LE COURS.
func btnCoursCheminNiveau2Valide_clique()->void:
	# Changer de panel.
	panelCheminNiveau2Valide.visible = false
	panelCours.visible = true

# FONCTION QUI AFFICHE LE COURS.
func btnCoursCheminNiveau3Valide_clique()->void:
	# Changer de panel.
	panelCheminNiveau3Valide.visible = false
	panelCours.visible = true

# FONCTION QUI AFFICHE LE COURS.
func btnCoursCheminNiveau4Valide_clique()->void:
	# Changer de panel.
	panelCheminNiveau4Valide.visible = false
	panelCours.visible = true

# FONCTION QUI AFFICHE LE COURS.
func btnCoursCheminTermine_clique()->void:
	# Changer de panel.
	panelCheminTermine.visible = false
	panelCours.visible = true

# FONCTION QUI AFFICHE LE NOUVEAU CHEMIN.
func btnFinLecture_clique()-> void:
	# Changer de panel.
	panelCours.visible = false;
	panelCheminCoursValide.visible = true;













# FONCTION QUI AFFICHE LE NIVEAU 1.
func btnNiveau1_clique()->void:
	# Changer de panel.
	panelCheminCoursValide.visible = false
	panelNiveau1.visible = true
	# Construire le niveau 1.
	constructionNiveau1()

# FONCTION QUI AFFICHE LE NIVEAU 1.
func btnNiveau1CheminNiveau1Valide_clique()->void:
	# Changer de panel.
	panelCheminNiveau1Valide.visible = false
	panelNiveau1.visible = true
	# Construire le niveau 1.
	constructionNiveau1()

# FONCTION QUI AFFICHE LE NIVEAU 1.
func btnNiveau1CheminNiveau2Valide_clique()->void:
	# Changer de panel.
	panelCheminNiveau2Valide.visible = false
	panelNiveau1.visible = true
	# Construire le niveau 1.
	constructionNiveau1()

# FONCTION QUI AFFICHE LE NIVEAU 1.
func btnNiveau1CheminNiveau3Valide_clique()->void:
	# Changer de panel.
	panelCheminNiveau3Valide.visible = false
	panelNiveau1.visible = true
	# Construire le niveau 1.
	constructionNiveau1()

# FONCTION QUI AFFICHE LE NIVEAU 1.
func btnNiveau1CheminNiveau4Valide_clique()->void:
	# Changer de panel.
	panelCheminNiveau4Valide.visible = false
	panelNiveau1.visible = true
	# Construire le niveau 1.
	constructionNiveau1()

# FONCTION QUI AFFICHE LE NIVEAU 1.
func btnNiveau1CheminTermine_clique()->void:
	# Changer de panel.
	panelCheminTermine.visible = false
	panelNiveau1.visible = true
	# Construire le niveau 1.
	constructionNiveau1()

# FONCTION QUI CONSTRUIT LE NIVEAU 1.
func constructionNiveau1()->void:
	# Décocher les checkbox
	Proposition1.button_pressed = false
	Proposition2.button_pressed = false
	Proposition3.button_pressed = false
	Proposition4.button_pressed = false
	# Générer des nombres aléatoirement pour l'énoncé.
	var nbEnonce1 = generateurAleatoire.randi_range(1,50)
	var nbEnonce2 = generateurAleatoire.randi_range(1,50)
	# Si le premier nombre est plus petit que le deuxième nombre ...
	if nbEnonce1 < nbEnonce2 :
		# ... stocker le permier nombre dans une variable et ...
		var nb = nbEnonce1
		# ... échanger les nombres.
		nbEnonce1 = nbEnonce2
		nbEnonce2 = nb
	# Placer les nombres dans l'énoncé.
	nbAleatoire1Niveau1.text = str(nbEnonce1)
	nbAleatoire2Niveau1.text = str(nbEnonce2)
	# Calculer le résultat de la soustraction. 
	var reponseCorrecte = nbEnonce1 - nbEnonce2 
	# Générer une liste de propositions incluant la réponse correcte.
	var propositionsPossibles = [reponseCorrecte]
	# Répéter trois fois pour les trois autres propositions.
	for i in range(3):
		# Générer un nombre aléatoire.
		var proposition = generateurAleatoire.randi_range(1, 50)
		# Tant que la proposition générée est déjà présente dans la liste des propositions possibles ...
		while proposition in propositionsPossibles:
			# ... Générer un nouveau nombre.
			proposition = generateurAleatoire.randi_range(1, 50)
		# Ajouter le nouveau nombre aléatoire aux propositions possibles.
		propositionsPossibles.append(proposition)
	# Mélanger les propositions possibles.
	propositionsPossibles.shuffle()
	# Attribuer les propositions aux CheckBox.
	for i in range(4):
		propositions[i].text = str(propositionsPossibles[i])

# FONCTION QUI VERIFIE LA REPONSE DE L'UTILISATEUR.
func btnValiderNiveau1_clique() -> void:
	# Déclarer la variable qui va stocker la réponses de l'utilisateur.
	var reponseUtilisateur = 0
	# Comparer la réponse de l'utilisateur avec la réponse correcte.
	var reponseCorrecte = int(nbAleatoire1Niveau1.text) - int(nbAleatoire2Niveau1.text)
	# Déclarer un boolean qui atteste si une case a été coché.
	var caseCochee = false
	# Répéter quatres fois pour les quatres propositions.
	for i in range(4):
		# Si le bouton a été pressé ...
		if propositions[i].button_pressed:
			# ... mettre le boolean a true et ...
			caseCochee = true
			# ... récupérer la réponse de l'utilisateur.
			reponseUtilisateur = int(propositions[i].text)
			# Sortir de la boucle.
			break
	# Si une case est cochée ...
	if caseCochee == true:
		# ... si la réponse est correcte ...
		if reponseUtilisateur == reponseCorrecte :
			# ... changer le panel.
			panelNiveau1.visible = false
			# Récupérer le chemin de l'image à afficher.
			var chemin = recompense[0][1][0]
			# Charger la texture.
			var texture = load(chemin)
			# Afficher la texture dans le TextureRect.
			morceauImage1.texture = texture
			panelBonneReponseNiveau1.visible = true
		# ... si non ...
		else:
			# ... changer le panel.
			panelNiveau1.visible = false
			explicationNiveau1.text = str("[color=#0E00FF]D e s s i n e s  ", int(nbAleatoire1Niveau1.text),"  r o n d s . [/color]
			[color=#137500]C o l o r i e s  ", int(nbAleatoire2Niveau1.text) ,"  r o n d s  e n  r o u g e . [/color]
			[color=#FF0000]C o m p t e s  l e s  r o n d s  r e s t a n t s . [/color]
			[color=#0E00FF]D o n c ,  t u  d e v r a i s  t r o u v e r  :  [/color][color=#137500]", int(nbAleatoire1Niveau1.text) ,"[/color][color=#FF0000]  -  [/color][color=#0E00FF]",int(nbAleatoire2Niveau1.text),"[/color][color=#137500]  =  [/color][color=#FF0000]",reponseCorrecte,"[/color]")
			panelMauvaiseReponseNiveau1.visible = true
	# Si non ...
	else:
		# ... indiquer le manque de case cochée.
		btnValiderNiveau1.text = str("Veuillez cocher une case avant de cliquer sur ce bouton pour valider")

# FONCTION QUI AUTORISE QU'UNE SEULE CHECKBOX SOIT COCHEE.
func on_checkbox_clique(toggled_on, name, value):
	if not toggled_on: 
		return
	# Pour chaque checkbox dans le Conteneur
	for i in $Marges/PanelNiveau1/Conteneur/ConteneurProposition/Conteneur.get_children():
		# Si son nom n'est pas le même que celui en paramètre et que c'est une checkbox ...
		if i.name != name and i is CheckBox:
			# ... décocher le bouton.
			i.button_pressed = false
	# Pour chaque checkbox dans le Conteneur2
	for i in $Marges/PanelNiveau1/Conteneur/ConteneurProposition/Conteneur2.get_children():
		# Si son nom n'est pas le même que celui en paramètre et que c'est une checkbox ...
		if i.name != name and i is CheckBox:
			# ... décocher le bouton.
			i.button_pressed = false

# FONCTION QUI RELANCE LE NIVEAU 1.
func btnRetenterNiveau1_clique() -> void:
	# Changer le panel.
	panelMauvaiseReponseNiveau1.visible = false
	panelNiveau1.visible = true
	# Construire le niveau 1.
	constructionNiveau1()

# FONCTION QUI RAFFICHE LE CHEMIN APRES LE NIVEAU 1 ECHOUE.
func btnCheminNiveau1_clique() -> void:
	# Changer le panel.
	panelMauvaiseReponseNiveau1.visible = false
	panelCheminCoursValide.visible = true

# FONCTION QUI RAFFICHE LE CHEMIN APRES LE NIVEAU 1 VALIDE.
func btnSuivantNiveau1_clique() -> void:
	# Changer le panel.
	panelBonneReponseNiveau1.visible = false
	panelCheminNiveau1Valide.visible = true













# FONCTION QUI AFFICHE LE NIVEAU 2.
func btnNiveau2_clique() -> void:
	# Changer le panel.
	panelCheminNiveau1Valide.visible = false
	panelNiveau2.visible = true
	# Construire le niveau 2.
	constructionNiveau2()

# FONCTION QUI AFFICHE LE NIVEAU 2.
func btnNiveau2CheminNiveau2Valide_clique() -> void:
	# Changer le panel.
	panelCheminNiveau2Valide.visible = false
	panelNiveau2.visible = true
	# Construire le niveau 2.
	constructionNiveau2()

# FONCTION QUI AFFICHE LE NIVEAU 2.
func btnNiveau2CheminNiveau4Valide_clique() -> void:
	# Changer le panel.
	panelCheminNiveau4Valide.visible = false
	panelNiveau2.visible = true
	# Construire le niveau 2.
	constructionNiveau2()

# FONCTION QUI AFFICHE LE NIVEAU 2.
func btnNiveau2CheminNiveau3Valide_clique() -> void:
	# Changer le panel.
	panelCheminNiveau3Valide.visible = false
	panelNiveau2.visible = true
	# Construire le niveau 2.
	constructionNiveau2()

# FONCTION QUI AFFICHE LE NIVEAU 2.
func btnNiveau2CheminTermine_clique() -> void:
	# Changer le panel.
	panelCheminTermine.visible = false
	panelNiveau2.visible = true
	# Construire le niveau 2.
	constructionNiveau2()

# FONCTION QUI CONSTRUIT LE NIVEAU 2.
func constructionNiveau2()->void:
	# Vider la case de saisit de l'utilisateur.
	reponseUtilisateurNiveau2.clear()
	# Générer des nombres aléatoirement pour l'énoncé.
	var nbEnonce1 = generateurAleatoire.randi_range(1,50)
	var nbEnonce2 = generateurAleatoire.randi_range(1,50)
	# Si le premier nombre est plus petit que le deuxième nombre ...
	if nbEnonce1 < nbEnonce2 :
		# ... stocker le permier nombre dans une variable et ...
		var nb = nbEnonce1
		# ... échanger les nombres.
		nbEnonce1 = nbEnonce2
		nbEnonce2 = nb
	# Placer les nombres dans l'énoncé.
	nbAleatoire1Niveau2.text = str(nbEnonce1)
	nbAleatoire2Niveau2.text = str(nbEnonce2)

# FONCTION QUI VERIFIE LA REPONSE DE L'UTILISATEUR.
func btnValiderNiveau2_clique()->void:
	# Récupérer la réponse de l'utilisateur.
	var reponseUtilisateur = reponseUtilisateurNiveau2.text
	# Calculer le résiltat de la soustraction.
	var reponseCorrecte = int(nbAleatoire1Niveau2.text) - int(nbAleatoire2Niveau2.text)
	# Si la réponse saisit par l'utilisateur est correcte ...
	if reponseUtilisateur == str(reponseCorrecte):
		# ... changer de panel.
		panelNiveau2.visible = false
		# Récupérer le chemin de l'image à afficher.
		var chemin = recompense[0][1][1]
		# Charger la texture.
		var texture = load(chemin)
		# Afficher la texture dans le TextureRect.
		morceauImage2.texture = texture
		panelBonneReponseNiveau2.visible = true
	#Si non ...
	else:
		# ... changer de panel.
		panelNiveau2.visible = false
		explicationNiveau2.text = str("[color=#0E00FF]D e s s i n e s  ", int(nbAleatoire1Niveau2.text),"  c a r r é s . [/color]
		[color=#137500]C o l o r i e s  ", int(nbAleatoire2Niveau2.text) ,"  c a r r é s  e n  r o u g e . [/color]
		[color=#FF0000]C o m p t e s  l e s  c a r r é s  r e s t a n t s . [/color]
		[color=#0E00FF]D o n c ,  t u  d e v r a i s  t r o u v e r  :  [/color][color=#137500]", int(nbAleatoire1Niveau2.text) ,"[/color][color=#FF0000]  -  [/color][color=#0E00FF]",int(nbAleatoire2Niveau2.text),"[/color][color=#137500]  =  [/color][color=#FF0000]",reponseCorrecte,"[/color]")
		panelMauvaiseReponseNiveau2.visible = true

# FONCTION QUI RELANCE LE NIVEAU 2.
func btnRetenterNiveau2_clique() -> void:
	# Changer le panel.
	panelMauvaiseReponseNiveau2.visible = false
	panelNiveau2.visible = true
	# Construire le niveau 2.
	constructionNiveau2()

# FONCTION QUI RAFFICHE LE CHEMIN APRES LE NIVEAU 2 ECHOUE.
func btnCheminNiveau2_clique() -> void:
	# Changer le panel.
	panelMauvaiseReponseNiveau2.visible = false
	panelCheminNiveau1Valide.visible = true

# FONCTION QUI RAFFICHE LE CHEMIN APRES LE NIVEAU 2 VALIDE.
func btnSuivantNiveau2_clique() -> void:
	# Changer le panel.
	panelBonneReponseNiveau2.visible = false
	panelCheminNiveau2Valide.visible = true













# FONCTION QUI AFFICHE LE NIVEAU 3.
func btnNiveau3_clique()->void:
	# Changer de panel.
	panelCheminNiveau2Valide.visible = false
	panelNiveau3.visible = true
	# Construire le niveau 3.
	constructionNiveau3()

# FONCTION QUI AFFICHE LE NIVEAU 3.
func btnNiveau3CheminNiveau3Valide_clique()->void:
	# Changer de panel.
	panelCheminNiveau3Valide.visible = false
	panelNiveau3.visible = true
	# Construire le niveau 3.
	constructionNiveau3()

# FONCTION QUI AFFICHE LE NIVEAU 3.
func btnNiveau3CheminNiveau4Valide_clique()->void:
	# Changer de panel.
	panelCheminNiveau4Valide.visible = false
	panelNiveau3.visible = true
	# Construire le niveau 3.
	constructionNiveau3()

# FONCTION QUI AFFICHE LE NIVEAU 3.
func btnNiveau3CheminTermine_clique()->void:
	# Changer de panel.
	panelCheminTermine.visible = false
	panelNiveau3.visible = true
	# Construire le niveau 3.
	constructionNiveau3()

# FONCTION QUI CONSTRUIT LE NIVEAU 3.
func constructionNiveau3()->void:
	# Vider le panel de réponse.
	reponseUtilisateurNiveau3.text = " "
	# Générer des nombres aléatoirement pour l'énoncé.
	var nbEnonce1 = generateurAleatoire.randi_range(1,50)
	var nbEnonce2 = generateurAleatoire.randi_range(1,50)
	# Si le premier nombre est plus petit que le deuxième nombre ...
	if nbEnonce1 < nbEnonce2 :
		# ... stocker le permier nombre dans une variable et ...
		var nb = nbEnonce1
		# ... échanger les nombres.
		nbEnonce1 = nbEnonce2
		nbEnonce2 = nb
	# Placer les nombres dans l'énoncé.
	nbAleatoire1Niveau3.text = str(nbEnonce1)
	nbAleatoire2Niveau3.text = str(nbEnonce2)
	# Calculer le résultat de la soustraction. 
	var reponseCorrecte = nbEnonce1 - nbEnonce2 
	# Générer une liste de propositions incluant la réponse correcte.
	var propositionsPossiblesNiveau3 = [reponseCorrecte]
	# Répéter trois fois pour les trois autres propositions.
	for i in range(3):
		# Générer un nombre aléatoire.
		var proposition = generateurAleatoire.randi_range(1, 50)
		# Tant que la proposition générée est déjà présente dans la liste des propositions possibles ...
		while proposition in propositionsPossiblesNiveau3:
			# ... Générer un nouveau nombre.
			proposition = generateurAleatoire.randi_range(1, 50)
		# Ajouter le nouveau nombre aléatoire aux propositions possibles.
		propositionsPossiblesNiveau3.append(proposition)
	# Mélanger les propositions possibles.
	propositionsPossiblesNiveau3.shuffle()
	# Attribuer les propositions aux boutons.
	for i in range(4):
		propositionsNiveau3[i].text = str(propositionsPossiblesNiveau3[i])

# FONCTION QUI PLACE LE TEXTE DU BOUTON DANS LE LABEL.
func proposition1_clique()->void:
	# Récupérer le texte du bouton sélectionné.
	var reponseSelectionne = proposition1.text
	# Placer le texte du bouton sélectionné dans le label.
	reponseUtilisateurNiveau3.text = reponseSelectionne

# FONCTION QUI PLACE LE TEXTE DU BOUTON DANS LE LABEL.
func proposition2_clique()->void:
	# Récupérer le texte du bouton sélectionné.
	var reponseSelectionne = proposition2.text
	# Placer le texte du bouton sélectionné dans le label.
	reponseUtilisateurNiveau3.text = reponseSelectionne

# FONCTION QUI PLACE LE TEXTE DU BOUTON DANS LE LABEL.
func proposition3_clique()->void:
	# Récupérer le texte du bouton sélectionné.
	var reponseSelectionne = proposition3.text
	# Placer le texte du bouton sélectionné dans le label.
	reponseUtilisateurNiveau3.text = reponseSelectionne

# FONCTION QUI PLACE LE TEXTE DU BOUTON DANS LE LABEL.
func proposition4_clique()->void:
	# Récupérer le texte du bouton sélectionné.
	var reponseSelectionne = proposition4.text
	# Placer le texte du bouton sélectionné dans le label.
	reponseUtilisateurNiveau3.text = reponseSelectionne

# FONCTION QUI VERIFIE LA REPONSE DE L'UTILISATEUR.
func btnValiderNiveau3_clique() -> void:
	# Récupérer la réponse de l'utilisateur.
	var reponseUtilisateur = reponseUtilisateurNiveau3.text
	# Calculer le résiltat de la soustraction.
	var reponseCorrecte = int(nbAleatoire1Niveau3.text) - int(nbAleatoire2Niveau3.text)
	# Si la réponse saisit par l'utilisateur est correcte ...
	if reponseUtilisateur == str(reponseCorrecte):
		# ... changer de panel.
		panelNiveau3.visible = false
		# Récupérer le chemin de l'image à afficher.
		var chemin = recompense[0][1][1]
		# Charger la texture.
		var texture = load(chemin)
		# Afficher la texture dans le TextureRect.
		morceauImage3.texture = texture
		panelBonneReponseNiveau3.visible = true
	#Si non ...
	else:
		# ... changer de panel.
		panelNiveau3.visible = false
		explicationNiveau3.text = str("[color=#0E00FF]D e s s i n e s  ", int(nbAleatoire1Niveau3.text),"  l o s a n g e s . [/color]
		[color=#137500]C o l o r i e s  ", int(nbAleatoire2Niveau3.text) ,"  l o s a n g e s  e n  r o u g e . [/color]
		[color=#FF0000]C o m p t e s  l e s  l o s a n g e s r e s t a n t s . [/color]
		[color=#0E00FF]D o n c ,  t u  d e v r a i s  t r o u v e r  :  [/color][color=#137500]", int(nbAleatoire1Niveau3.text) ,"[/color][color=#FF0000]  -  [/color][color=#0E00FF]",int(nbAleatoire2Niveau3.text),"[/color][color=#137500]  =  [/color][color=#FF0000]",reponseCorrecte,"[/color]")
		panelMauvaiseReponseNiveau3.visible = true

# FONCTION QUI RELANCE LE NIVEAU 3.
func btnRetenterNiveau3_clique() -> void:
	# Changer le panel.
	panelMauvaiseReponseNiveau3.visible = false
	panelNiveau3.visible = true
	# Construire le niveau 3.
	constructionNiveau3()

# FONCTION QUI RAFFICHE LE CHEMIN APRES LE NIVEAU 3 ECHOUE.
func btnCheminNiveau3_clique() -> void:
	# Changer le panel.
	panelMauvaiseReponseNiveau3.visible = false
	panelCheminNiveau2Valide.visible = true

# FONCTION QUI RAFFICHE LE CHEMIN APRES LE NIVEAU 3 VALIDE.
func btnSuivantNiveau3_clique() -> void:
	# Changer le panel.
	panelBonneReponseNiveau3.visible = false
	panelCheminNiveau3Valide.visible = true













# FONCTION QUI AFFICHE LE NIVEAU 4.
func btnNiveau4_clique()->void:
	# Changer de panel.
	panelCheminNiveau3Valide.visible = false
	panelNiveau4.visible = true
	# Construire le niveau 3.
	constructionNiveau4()

# FONCTION QUI AFFICHE LE NIVEAU 4.
func btnNiveau4CheminNiveau4Valide_clique()->void:
	# Changer de panel.
	panelCheminNiveau4Valide.visible = false
	panelNiveau4.visible = true
	# Construire le niveau 3.
	constructionNiveau4()

# FONCTION QUI AFFICHE LE NIVEAU 4.
func btnNiveau4CheminTermine_clique()->void:
	# Changer de panel.
	panelCheminTermine.visible = false
	panelNiveau4.visible = true
	# Construire le niveau 3.
	constructionNiveau4()

# FONCTION QUI CONSTRUIT LE NIVEAU 4.
func constructionNiveau4()->void:
	# Vider la case de saisit de l'utilisateur.
	reponseUtilisateurNiveau4.clear()
	# Générer des nombres aléatoirement pour l'énoncé.
	var nbEnonce1 = generateurAleatoire.randi_range(1,50)
	var nbEnonce2 = generateurAleatoire.randi_range(1,50)
	# Si le premier nombre est plus petit que le deuxième nombre ...
	if nbEnonce1 < nbEnonce2 :
		# ... stocker le permier nombre dans une variable et ...
		var nb = nbEnonce1
		# ... échanger les nombres.
		nbEnonce1 = nbEnonce2
		nbEnonce2 = nb
	var reponseCorrecte = nbEnonce1 - nbEnonce2
	# Si la différence nrte les deux est plus grand que le premier nombre aléatoire ...
	if nbEnonce2 < reponseCorrecte:
		nbEnonce2 = reponseCorrecte
	# Placer les nombres dans l'énoncé.
	nbAleatoire1Niveau4.text = str(nbEnonce1)
	nbAleatoire2Niveau4.text = str(nbEnonce2)

# FONCTION QUI VERIFIE LA REPONSE DE L'UTILISATEUR.
func btnValiderNiveau4_clique()->void:
	# Récupérer la réponse de l'utilisateur.
	var reponseUtilisateur = reponseUtilisateurNiveau4.text
	# Calculer le résiltat de la soustraction.
	var reponseCorrecte = int(nbAleatoire1Niveau4.text) - int(nbAleatoire2Niveau4.text)
	# Si la réponse saisit par l'utilisateur est correcte ...
	if reponseUtilisateur == str(reponseCorrecte):
		# ... changer de panel.
		panelNiveau4.visible = false
		# Récupérer le chemin de l'image à afficher.
		var chemin = recompense[0][1][2]
		# Charger la texture.
		var texture = load(chemin)
		# Afficher la texture dans le TextureRect.
		morceauImage4.texture = texture
		panelBonneReponseNiveau4.visible = true
	#Si non ...
	else:
		# ... changer de panel.
		panelNiveau4.visible = false
		explicationNiveau4.text = str("[color=#0E00FF]D e s s i n e s  ", int(nbAleatoire2Niveau4.text),"  c a r r é s . [/color]
		[color=#137500]C o l o r i e s  ", int(nbAleatoire1Niveau4.text) ,"  c a r r é s  e n  r o u g e . [/color]
		[color=#FF0000]C o m p t e s  l e s  c a r r é s  r e s t a n t s . [/color]
		[color=#0E00FF]D o n c ,  t u  d e v r a i s  t r o u v e r  :  [/color][color=#137500]", int(nbAleatoire2Niveau4.text) ,"[/color][color=#FF0000]  -  [/color][color=#0E00FF]",int(nbAleatoire1Niveau4.text),"[/color][color=#137500]  =  [/color][color=#FF0000]",reponseCorrecte,"[/color]")
		panelMauvaiseReponseNiveau4.visible = true

# FONCTION QUI RELANCE LE NIVEAU 4.
func btnRetenterNiveau4_clique() -> void:
	# Changer le panel.
	panelMauvaiseReponseNiveau4.visible = false
	panelNiveau4.visible = true
	# Construire le niveau 4.
	constructionNiveau4()

# FONCTION QUI RAFFICHE LE CHEMIN APRES LE NIVEAU 4 ECHOUE.
func btnCheminNiveau4_clique() -> void:
	# Changer le panel.
	panelMauvaiseReponseNiveau4.visible = false
	panelCheminNiveau3Valide.visible = true

# FONCTION QUI RAFFICHE LE CHEMIN APRES LE NIVEAU 4 VALIDE.
func btnSuivantNiveau4_clique() -> void:
	# Changer le panel.
	panelBonneReponseNiveau4.visible = false
	panelCheminNiveau4Valide.visible = true













# FONCTION QUI AFFICHE LE NIVEAU 5.
func btnNiveau5_clique()->void:
	# Changer de panel.
	panelCheminNiveau4Valide.visible = false
	panelNiveau5.visible = true
	# Construire le niveau 5.
	constructionNiveau5()

# FONCTION QUI AFFICHE LE NIVEAU 5.
func btnNiveau5CheminTermine_clique()->void:
	# Changer de panel.
	panelCheminTermine.visible = false
	panelNiveau5.visible = true
	# Construire le niveau 5.
	constructionNiveau5()

# FONCTION QUI CONSTRUIT LE NIVEAU 5.
func constructionNiveau5()->void:
	# Vider le TextEdit de réponse.
	reponseUtilisateurNiveau5.clear()
	# Générer un nombre aléatoire.
	nbProbleme = generateurAleatoire.randi_range(0,problemes.size()-1)
	# Parcourir la liste de problemes.
	enonceNiveau5.text = problemes[nbProbleme][0]

# FONCTION QUI VERIFIE LA REPONSE DE L'UTILISATEUR.
func btnValiderNiveau5_clique()->void:
	# Récupérer la réponse de l'utilisateur.
	var reponseUtilisateur = reponseUtilisateurNiveau5.text
	# Récupérer la bonne réponse.
	var reponseCorrecte = problemes[nbProbleme][1]
	# Si la réponse saisit par l'utilisateur est correcte ...
	if reponseUtilisateur == str(reponseCorrecte):
		# ... changer de panel.
		panelNiveau5.visible = false
		panelFinDeParcours.visible = true
	#Si non ...
	else:
		# ... changer de panel.
		panelNiveau5.visible = false
		explicationNiveau5.text = str("[color=#0E00FF]Lis attentivement l'énoncé et dessines le.[/color]")
		panelMauvaiseReponseNiveau5.visible = true

# FONCTION QUI RELANCE LE NIVEAU 5.
func btnRetenterNiveau5_clique() -> void:
	# Changer le panel.
	panelMauvaiseReponseNiveau5.visible = false
	panelNiveau5.visible = true
	# Construire le niveau 4.
	constructionNiveau4()

# FONCTION QUI RAFFICHE LE CHEMIN APRES LE NIVEAU 5 ECHOUE.
func btnCheminNiveau5_clique() -> void:
	# Changer le panel.
	panelMauvaiseReponseNiveau5.visible = false
	panelCheminNiveau4Valide.visible = true

# FONCTION QUI AFFICHE L'OUVERTURE DU COFFRE.
func btnCoffreFerme_clique() -> void:
	# Changer le panel.
	panelFinDeParcours.visible = false
	# Déclarer le chemin finit 
	chapitreSoustractionFinit = true
	# Récupérer le chemin de l'image à afficher.
	var chemin = recompense[0][0]
	# Charger la texture.
	var texture = load(chemin)
	# Afficher la texture dans le TextureRect.
	imageRecompense.texture = texture
	# Ajouter l'image à la collection.
	images.collecter_image(recompense[0][0])
	panelRecompense.visible = true













# FONCTION QUI AFFICHE LE PARCOURS FINIT.
func btnCheminRecompense_clique() -> void:
	# Changer le panel.
	panelRecompense.visible = false
	panelCheminTermine.visible = true













# FONCTION QUI AFFICHE LE PARCOURS FINIT.
func btnRecommencer_clique() -> void:
	# Changer le panel.
	panelCheminTermine.visible = false
	#images.supprimer_images()
	panelAccueil.visible = true



func get_fin():
	return chapitreSoustractionFinit

