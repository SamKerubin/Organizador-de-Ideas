extends Node

func show_node_info(node: BaseNode) -> void:
	print(node.info.name)
	print(node.info.description)

	if not node.have_any_relation():
		print("Este nodo no mantiene una relacion a otros nodos")
		return

	for relation: NodeRelation in node.get_relations():
		print(relation.get_related_node().info.name)

	var node_name: String = node.info.name
	var node_desc: String = node.info.description
	var relations: Array[BaseNode] = []

	for rel: NodeRelation in node.get_relations():
		relations.append(rel.get_related_node())


	var data: Dictionary[String, Variant] = {
		"name": node_name,
		"description": node_desc,
		"relations": relations
	}

	InterfaceManager.create_interface(InterfaceIndex.InterfaceType.NODE_INFORMATION, data)

func change_title(node: BaseNode, new_value: String) -> void:
	change_node_attribute(node, "title", new_value)

func change_description(node: BaseNode, new_value: String) -> void:
	change_node_attribute(node, "description", new_value)

func change_node_attribute(node: BaseNode, attribute: String, new_value: String) -> void:
	node.info.set(attribute, new_value)
