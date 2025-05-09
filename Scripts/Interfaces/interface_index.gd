extends Node
class_name InterfaceIndex

const INTERFACES: Dictionary[InterfaceType, PackedScene] = {
	InterfaceType.NODE_SEARCH_MENU: preload("uid://bq1pwhs1vhndg"),
	InterfaceType.NODE_CREATION: preload("uid://dv3n6758gih8s"),
	InterfaceType.NODE_INFORMATION: preload("uid://b61qxg1xtjnws"),
	InterfaceType.PROJECT_INTERFACE: preload("uid://bq3ixrp0u62b")
}

enum InterfaceType {
	NODE_SEARCH_MENU,
	NODE_SELECTION_MENU,
	NODE_CREATION,
	NODE_DELETION,
	NODE_EDITING,
	NODE_INFORMATION,
	CONNECTION_INFORMATION,
	PROJECT_INTERFACE
}
