extends Node

signal node_deleted(deleted_node: BaseNode)
signal node_relations_updated(node: BaseNode)

var nodes: Dictionary[String, BaseNode]

func create_node(node_name: String, node_description: String, scene: Control, 
				node_relations: Array[NodeRelation]=[]) -> void:
	if node_name in nodes:
		print("Nodo ya existente")
		return

	var node: BaseNode = BaseNode.new()
	node.info.name = node_name
	node.info.description = node_description
	node.relations = node_relations
	
	nodes.set(node_name, node)

	scene.add_child(node)

	if node_relations != []: node_relations_updated.emit(node)

func delete_node(node_to_delete: BaseNode) -> void:
	# Ask confirmation and other things first...
	node_deleted.emit(node_to_delete)

	node_to_delete.queue_free()

func get_node_with_name(node_name: String) -> BaseNode:
	return nodes.get(node_name)
