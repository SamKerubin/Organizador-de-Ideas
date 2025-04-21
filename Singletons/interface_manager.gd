extends Node

var instantiate_scene: MainProject 
var active_interfaces: Array[BaseInterface]

func create_interface(interface_type: InterfaceIndex.InterfaceType, data: Dictionary[String, Variant]) -> void:
	var new_interface: BaseInterface = InterfaceIndex.INTERFACES[interface_type].instantiate()

func remove_interface() -> void: pass

func change_interface_to(interface_type: InterfaceIndex.InterfaceType, data: Dictionary[String, Variant]) -> void: pass
