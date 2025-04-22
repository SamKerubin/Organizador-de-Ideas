extends BaseInterface
class_name NodeInformation

@onready var node_name: Label = $CanvasLayer/Panel/Label2
@onready var description: Label = $CanvasLayer/Panel/Label4
@onready var node_relations: NodeContainer = $CanvasLayer/Panel/NodeContainer
@onready var close_button: Button = $CanvasLayer/Button

func _ready() -> void:
	node_relations.set_container_columns(2)
	
func _on_close_button_pressed() -> void:
	InterfaceManager.remove_interface(self, type)

func _on_node_clicked(node: BaseNode) -> void:
	pass # Replace with function body.

func set_up(data: Dictionary[String, Variant]) -> void:
	var n_name: String = data["name"]
	var node_desc: String = data["description"]
	var realations: Array[BaseNode] = data["relations"]

	node_name.text = n_name
	description.text = node_desc
	node_relations.display_nodes(realations)
