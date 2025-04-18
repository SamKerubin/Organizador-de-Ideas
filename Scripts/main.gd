extends Control

func _ready() -> void:
	var new_node: BaseNode = NodeManager.create_node("node-1", "something", BaseNode.get_default_position(Vector2(100, 100)))
	var new_node2: BaseNode = NodeManager.create_node("node-2", "something", Vector2(100, 100))
	add_child(new_node)
	add_child(new_node2)
