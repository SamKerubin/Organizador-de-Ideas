extends Node

signal updated_relation(from_node: BaseNode, new_relation: BaseNode, to_node: BaseNode)
signal node_created(new_node: BaseNode, relations: Dictionary[String, BaseNode])
signal node_deleted(node_eliminated: BaseNode)
