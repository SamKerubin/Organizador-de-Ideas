extends Node

const NODE_SCENE: PackedScene = preload("uid://ch4tu3aqobhrx")

signal node_deleted(deleted_node: BaseNode)

var nodes: Dictionary[String, BaseNode]

func create_node(node_name: String, node_desc: String, position: Vector2=BaseNode.get_default_position(),
				node_relations: Array[NodeRelation]=[]) -> BaseNode:
	if node_name in nodes:
		print("Nodo ya existente")
		return

	var node: BaseNode = NODE_SCENE.instantiate()
	node.info.name = node_name
	node.info.description = node_desc
	node.relations = node_relations
	node.position = position

	nodes.set(node_name, node)
	
	return node

func delete_node(node_to_delete: BaseNode) -> void:
	# Ask confirmation and other things first...
	node_deleted.emit(node_to_delete)

	node_to_delete.remove_all_relations()
	nodes.erase(node_to_delete.info.name)
	node_to_delete.queue_free()

func get_node_with_name(node_name: String) -> BaseNode:
	return nodes.get(node_name)
