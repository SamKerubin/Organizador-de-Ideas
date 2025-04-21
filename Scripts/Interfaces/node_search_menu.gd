extends BaseInterface
class_name NodeSearchMenu

@onready var nodes_box: GridContainer = $CanvasLayer/Panel/ScrollContainer/GridContainer
@onready var search_related_nodes: Button = $CanvasLayer/Panel/Button
@onready var search_unrelated_nodes: Button = $CanvasLayer/Panel/Button2
@onready var search_all: Button = $CanvasLayer/Panel/Button3
@onready var close_button: Button = $CanvasLayer/Button

var related_nodes: Array[BaseNode]
var unrelated_nodes: Array[BaseNode]

func _on_close_button_pressed() -> void:
	InterfaceManager.remove_interface(self, type)

func _on_related_nodes_button_pressed() -> void:
	display_nodes(related_nodes)

func _on_unrelated_nodes_button_pressed() -> void:
	display_nodes(unrelated_nodes)

func _on_all_nodes_button_pressed() -> void:
	display_nodes(NodeManager.nodes.values())

func _node_button_pressed(node: BaseNode) -> void:
	node.show_info()

func set_up(data: Dictionary[String, Array]) -> void:
	related_nodes = data["related_nodes"]
	unrelated_nodes = data["unrelated_nodes"]

func display_nodes(nodes: Array[BaseNode]) -> void:
	clear_node_box_children()

	if nodes.is_empty():
		var label: Label = Label.new()
		nodes_box.add_child(label)
		label.text = "No hay nodos de este tipo"

	for n: BaseNode in nodes:
		nodes_box.add_child(create_node_button(n))

func create_node_button(n: BaseNode) -> Button:
	var button: Button = Button.new()
	button.text = n.info.name
	button.mouse_default_cursor_shape = 2
	button.modulate = SavingManager.node_colors["related_node"] \
		if n.have_any_relation() \
		else SavingManager.node_colors["unrelated_node"]
	button.pressed.connect(_node_button_pressed.bind(n))

	return button

func clear_node_box_children() -> void:
	for c: Control in nodes_box.get_children():
		c.queue_free()
