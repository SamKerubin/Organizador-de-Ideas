extends Control
class_name MainProject

func _ready() -> void:
	NodeConnectionManager.instantiate_scene = self
	NodeManager.instantiate_scene = self
