extends Node

var instantiate_scene: MainProject 
var active_interfaces: Dictionary[InterfaceIndex.InterfaceType, Array]

func create_interface(interface_type: InterfaceIndex.InterfaceType, 
					data: Dictionary[String, Variant]={}) -> BaseInterface:
	var new_interface: BaseInterface = InterfaceIndex.INTERFACES[interface_type].instantiate()
	instantiate_scene.add_child(new_interface)
	new_interface.set_up(data)
	new_interface.set_type(interface_type)

	if active_interfaces.has(interface_type): active_interfaces.get(interface_type).append(new_interface)
	else: active_interfaces[interface_type] = [new_interface]

	return new_interface

func remove_interface(interface: BaseInterface, type: InterfaceIndex.InterfaceType) -> void:
	if type in active_interfaces:
		active_interfaces.get(type).erase(interface)
		interface.queue_free()

func remove_all_interfaces_with_type(type: InterfaceIndex.InterfaceType) -> void:
	if type in active_interfaces: active_interfaces.erase(type)
