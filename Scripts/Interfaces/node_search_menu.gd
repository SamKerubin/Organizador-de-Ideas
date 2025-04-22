extends BaseInterface
class_name NodeSearchMenu

@onready var node_container: NodeContainer = $CanvasLayer/Panel/NodeContainer
@onready var search_related_nodes: Button = $CanvasLayer/Panel/Button
@onready var search_unrelated_nodes: Button = $CanvasLayer/Panel/Button2
@onready var search_all: Button = $CanvasLayer/Panel/Button3
@onready var close_button: Button = $CanvasLayer/Button

func _ready() -> void:
	node_container.set_container_columns(3)

func _on_close_button_pressed() -> void:
	InterfaceManager.remove_interface(self, type)

func _on_related_nodes_button_pressed() -> void:
	node_container.display_nodes(NodeManager.get_related_nodes())

func _on_unrelated_nodes_button_pressed() -> void:
	node_container.display_nodes(NodeManager.get_unrelated_nodes())

func _on_all_nodes_button_pressed() -> void:
	node_container.display_nodes(NodeManager.nodes.values())

func _on_node_clicked(node: BaseNode) -> void:
	node.show_info()
