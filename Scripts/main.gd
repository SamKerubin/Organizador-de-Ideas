extends Control

func _ready() -> void:
	var new_node: BaseNode = NodeManager.create_node("node-1", "something", BaseNode.get_default_position())
	var new_node2: BaseNode = NodeManager.create_node("node-2", "something", Vector2(100, 100))
	new_node.add_relation_with.call_deferred(new_node2, "porq yo quiero")
	add_child(new_node)
	add_child(new_node2)
