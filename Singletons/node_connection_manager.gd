extends Node

const NODE_CONNECTION_SCENE: PackedScene = preload("uid://bax452bgxw2wq")

signal node_is_being_dragged(node_dragged: BaseNode)
signal connection_deleted

var instantiate_scene: MainProject

var connections: Array[NodeConnection]

func create_connection_between(node_a: BaseNode, node_b: BaseNode) -> NodeConnection:
	if node_a == node_b: 
		print("No se puede crear una conexion entre mismos nodos")
		return null

	if get_connection_with_nodes(node_a, node_b):
		print("Ya hay una relacion entre los nodos")
		return null

	var new_connection: NodeConnection = NODE_CONNECTION_SCENE.instantiate()
	instantiate_scene.add_child(new_connection)

	var relation_between_nodes: NodeRelation = node_a.get_relation_with(node_b)
	var reason: String = relation_between_nodes.get_reason()

	new_connection.set_connection_between.call_deferred(node_a, node_b, reason)
	connections.append(new_connection)

	return new_connection

func delete_connection_between(node_a: BaseNode, node_b: BaseNode) -> void:
	var connection: NodeConnection = get_connection_with_nodes(node_a, node_b)
	connection.set_conection_between(null, null, "")
	connections.erase(connection)
	connection.queue_free()

	connection_deleted.emit()

func get_connection_with_nodes(node_a: BaseNode, node_b: BaseNode) -> NodeConnection:
	for connection: NodeConnection in connections:
		if connection and connection.connected_to(node_a, node_b):
			return connection
	return null
