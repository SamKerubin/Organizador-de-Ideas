extends Control

func _ready() -> void:
	var new_node: BaseNode = NodeManager.create_node("node-1", "something")
	var new_node2: BaseNode = NodeManager.create_node("node-2", "something", Vector2(-500, 0))
	new_node.add_relation_with.call_deferred(new_node2, "porq yo quiero")
	var new_connection: NodeConnection = NodeConnectionManager.create_connection_between(new_node, new_node2, "porq yo quiero")
	add_child(new_node)
	add_child(new_node2)
	add_child(new_connection)
