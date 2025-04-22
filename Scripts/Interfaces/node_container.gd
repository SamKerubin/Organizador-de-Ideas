extends ScrollContainer
class_name NodeContainer

signal node_clicked(node: BaseNode)

@onready var container: GridContainer = $GridContainer

func _node_button_pressed(node: BaseNode) -> void:
	node_clicked.emit(node)
	
func display_nodes(nodes: Array[BaseNode]) -> void:
	clear_all_children()

	if nodes.is_empty():
		var label: Label = Label.new()
		container.add_child(label)
		label.text = "No hay nodos de este tipo"
		return

	for n: BaseNode in nodes:
		container.add_child(create_node_button(n))

func create_node_button(n: BaseNode) -> Button:
	var button: Button = Button.new()
	button.text = n.info.name
	button.mouse_default_cursor_shape = 2
	button.modulate = SavingManager.node_colors["related_node"] \
		if n.have_any_relation() \
		else SavingManager.node_colors["unrelated_node"]
	button.pressed.connect(_node_button_pressed.bind(n))

	return button

func set_container_columns(columns: int) -> void:
	container.columns = columns

func clear_all_children() -> void:
	for c: Control in container.get_children():
		c.queue_free()
