extends Panel

signal item_dropped_on_target
var draggable: PackedScene = preload("res://Scenes/draggable.tscn")
@export var target_container: Panel
@export var draggable_container: GridContainer

func _can_drop_data(at_position: Vector2, data) -> bool:
	var can_drop: bool = data is Node and data.is_in_group("DRAGGABLE")
	print("[From target_case] can_drop_data has run, returning %s" % can_drop)
	return can_drop
		
func _drop_data(at_position: Vector2, data) -> void:
	print("[From target_case] drop_data has run")
	print("[From target_case] Emitting signal: item_dropped_on_target")

	var draggable_copy = draggable.instantiate()
	target_container.add_child(draggable_copy)
	draggable_copy.label.text = data.label.text
	draggable_copy.id = data.id
	draggable_copy.dropped_on_target = true
	draggable_copy = data
		
	print("[ID of Item added] %s"%draggable_copy.id)
	print("[LABEL of Item added] %s"%draggable_copy.label.text)
				
	# Supprimer l'élément de son emplacement d'origine
	if data.get_parent() != null:  # Vérifier si l'élément a un parent
		data.get_parent().remove_child(data)  # Retirer l'élément de son parent
				
	item_dropped_on_target.emit()
