extends Node

signal node_is_being_dragged(node_dragged: BaseNode)
signal connection_deleted

const NODE_CONNECTION_SCENE: PackedScene = preload("uid://bax452bgxw2wq")

var connections: Array[NodeConnection]

func create_connection_between(node_a: BaseNode, node_b: BaseNode, reason: String) -> NodeConnection:
	if node_a.is_related_to(node_b):
		print("Ya hay una relacion entre los nodos")
		return

	var new_connection: NodeConnection = NODE_CONNECTION_SCENE.instantiate()
	new_connection.set_conection_between.call_deferred(node_a, node_b, reason)
	connections.append(new_connection)
	
	return new_connection

func delete_conection_between(node_a: BaseNode, node_b: BaseNode) -> void:
	var connection: NodeConnection = get_connection_with_nodes(node_a, node_b)
	connection.set_conection_between(null, null, "")
	connection.queue_free()

	connection_deleted.emit()

func get_connection_with_nodes(node_a: BaseNode, node_b: BaseNode) -> NodeConnection:
	var connection_index: int = connections.find(func(x: NodeConnection) -> bool:
		return node_a == x.node_1 or node_b == x.node_2
	)

	return connections.get(connection_index) if connection_index != -1 else null
