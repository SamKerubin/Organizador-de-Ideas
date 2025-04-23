extends Node

const NODE_SCENE: PackedScene = preload("uid://ch4tu3aqobhrx")

signal node_deleted(deleted_node: BaseNode)

var instantiate_scene: MainProject
var nodes: Dictionary[String, BaseNode]

func create_node(node_name: String, node_desc: String, node_relations: Array[NodeRelation]=[],
				position: Vector2=Vector2.ZERO) -> BaseNode:
	if node_name in nodes:
		print("Nodo ya existente")
		return null

	var node: BaseNode = NODE_SCENE.instantiate()

	node.info.name = node_name
	node.info.description = node_desc
	node.relations = node_relations
	node.position = position if position != Vector2.ZERO else get_node_default_position()
	nodes.set(node_name, node)
	instantiate_scene.add_child(node)

	return node

func delete_node(node_to_delete: BaseNode) -> void:
	node_deleted.emit(node_to_delete)

	node_to_delete.remove_all_relations()
	nodes.erase(node_to_delete.info.name)
	node_to_delete.queue_free()

func get_node_with_name(node_name: String) -> BaseNode:
	return nodes.get(node_name)

func get_related_nodes() -> Array[BaseNode]:
	return nodes.values().filter(func(x: BaseNode) -> bool: return not x.have_any_relation())

func get_unrelated_nodes() -> Array[BaseNode]:
	return nodes.values().filter(func(x: BaseNode) -> bool: return x.have_any_relation())

func get_node_default_position() -> Vector2:
	return get_viewport().get_visible_rect().size / 2
