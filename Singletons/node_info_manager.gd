extends Node

signal title_changed(changed_node: BaseNode)

func show_node_info(node: BaseNode) -> void:
	print(node.info.name)
	print(node.info.description)

	if node.get_relations() == []: return

	for relation: NodeRelation in node.get_relations():
		print(relation.get_related_node().info.name)
		print(relation.get_reason())

func change_title(node: BaseNode, new_value: String) -> void:
	change_node_attribute(node, "title", new_value)
	title_changed.emit(node)

func change_description(node: BaseNode, new_value: String) -> void:
	change_node_attribute(node, "description", new_value)

func change_node_attribute(node: BaseNode, attribute: String, new_value: String) -> void:
	node.info.set(attribute, new_value)
