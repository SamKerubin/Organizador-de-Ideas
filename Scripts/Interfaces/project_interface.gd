extends BaseInterface
class_name ProjectInterface

@onready var menu_button: Button = $CanvasLayer/Button

func _on_button_pressed() -> void:
	InterfaceManager.create_interface(InterfaceIndex.InterfaceType.NODE_CREATION)
