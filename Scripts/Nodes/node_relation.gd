extends Node
class_name NodeRelation

var node_related: BaseNode

var reason: String

func get_related_node() -> BaseNode:
	return node_related

func get_reason() -> String:
	return reason
