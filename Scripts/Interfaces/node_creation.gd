extends BaseInterface
class_name NodeCreation

@onready var create_node_interface: Panel = $CanvasLayer/Panel
@onready var search_node_interface: Panel = $CanvasLayer/Panel3
@onready var node_name: TextEdit = $CanvasLayer/Panel/TextEdit
@onready var node_description: TextEdit = $CanvasLayer/Panel/TextEdit2

var selected_nodes: Array[NodeRelation] = []

func _on_search_nodes_pressed() -> void:
	pass

func _on_create_node_pressed() -> void:
	if not node_name.text or not node_description.text:
		print("Debe rellenar todos los campos")
		return
	
	print(node_name.text)
	print(node_description.text)
	print(selected_nodes)
	
	NodeManager.create_node(node_name.text, node_description.text, selected_nodes)

func _on_close_button_pressed() -> void:
	InterfaceManager.remove_interface(self, type)
