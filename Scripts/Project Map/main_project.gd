extends Control
class_name MainProject

func _ready() -> void:
	NodeConnectionManager.instantiate_scene = self
	NodeManager.instantiate_scene = self
	InterfaceManager.instantiate_scene = self

	InterfaceManager.create_interface(InterfaceIndex.InterfaceType.PROJECT_INTERFACE)
