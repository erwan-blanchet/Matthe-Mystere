extends ColorRect


#=========================== VARAIBLE DE CLASSE ===========================#
#--- Variable de classe
var id: int
var original_label: String
@export var label: Label
#-- Mettre a true une fois que nous avons deposer l'élément sur notre cible
var dropped_on_target: bool =  false
#===========================================================================#

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("DRAGGABLE")

#================== FONCTION DE CLASSE ==================#
#--------------- Fonction qui permet de savoir si un item est manipulé et déposé ---------------#
func _get_drag_data(at_position: Vector2):
	print("[Draggable] get_drag_data has run")
	if not dropped_on_target:
		set_drag_preview(_get_preview_control())
		return self
#--------------------------------------------------------------------------------------#

#-------------- Fonction qui permet d'avoir une prévisualisation durant l'action glisser déposer --------------#
func _get_preview_control() -> Control:
	var preview = ColorRect.new()
	preview.size = size
	var preview_color = color
	preview_color.a = 0.5
	preview.color = preview_color
	return preview
#----------------------------------------------------------------------------------------------------------------#
#=========================================================#
