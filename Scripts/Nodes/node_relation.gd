extends Node
class_name NodeRelation

var node_related: BaseNode

var reason: String

func _init(node: BaseNode, relation_reason: String) -> void:
	node_related = node
	relation_reason = reason

func get_related_node() -> BaseNode:
	return node_related

func get_reason() -> String:
	return reason
