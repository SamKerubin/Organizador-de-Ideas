extends Control
class_name BaseInterface

var type: InterfaceIndex.InterfaceType

func set_type(t: InterfaceIndex.InterfaceType) -> void:
	type = t

func set_up(data: Dictionary[String, Variant]) -> void: pass
