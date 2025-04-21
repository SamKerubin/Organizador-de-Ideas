extends BaseInterface
class_name ProjectInterface

@onready var menu_button: Button = $CanvasLayer/Button

func _on_button_pressed() -> void:
	var data: Dictionary[String, Variant] = {
		"related_nodes": NodeManager.get_related_nodes(),
		"unrelated_nodes": NodeManager.get_unrelated_nodes()
	}
	
	InterfaceManager.create_interface(InterfaceIndex.InterfaceType.NODE_SEARCH_MENU, data)
