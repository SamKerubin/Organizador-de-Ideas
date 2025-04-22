extends Control
@onready var main_project: MainProject = $MainProject

func _ready() -> void:
	var new_node: BaseNode = NodeManager.create_node("node-1", "something")
	var new_node2: BaseNode = NodeManager.create_node("node-2", "something")
	var new_node3: BaseNode = NodeManager.create_node("node-3", "something")
	var new_node4: BaseNode = NodeManager.create_node("node-4", "something")

	setup_relations_and_connections.call_deferred(new_node, new_node2, new_node3, new_node4)

func setup_relations_and_connections(n1: BaseNode, n2: BaseNode, n3: BaseNode, n4: BaseNode) -> void:
	n1.add_relation_with(n2, "porq yo quiero")
	n1.add_relation_with(n3, "porq si")
	n3.add_relation_with(n2, "porq si")
	n4.add_relation_with(n1, "si")
	n4.add_relation_with(n2, "si")
	n4.add_relation_with(n3, "si")
