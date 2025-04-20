extends Control

func _ready() -> void:
	var new_node: BaseNode = NodeManager.create_node("node-1", "something")
	var new_node2: BaseNode = NodeManager.create_node("node-2", "something", Vector2(-500, 0))
	var new_node3: BaseNode = NodeManager.create_node("node-3", "something", Vector2(-500, -50))
	add_child(new_node)
	add_child(new_node2)
	add_child(new_node3)
	setup_relations_and_connections.call_deferred(new_node, new_node2, new_node3)

func setup_relations_and_connections(n1: BaseNode, n2: BaseNode, n3: BaseNode) -> void:
	n1.add_relation_with(n2, "porq yo quiero")
	n1.add_relation_with(n3, "porq si")
	n3.add_relation_with(n2, "porq si")

	var c1: NodeConnection = NodeConnectionManager.create_connection_between(n1, n2)
	var c2: NodeConnection = NodeConnectionManager.create_connection_between(n2, n3)
	var c3: NodeConnection = NodeConnectionManager.create_connection_between(n1, n3)

	add_child(c1)
	add_child(c2)
	add_child(c3)
