extends Node
class_name InterfaceIndex

const INTERFACES: Dictionary[InterfaceType, PackedScene] = {
	InterfaceType.NODE_SEARCH_MENU: preload("uid://bq1pwhs1vhndg"),
	InterfaceType.PROJECT_INTERFACE: preload("uid://bq3ixrp0u62b")
}

enum InterfaceType {
	NODE_SEARCH_MENU,
	NOED_SELECTION_MENU,
	NODE_CREATION,
	NODE_DELETION,
	NODE_EDITING,
	NODE_INFORMATION,
	CONNECTION_INFORMATION,
	PROJECT_INTERFACE
}
