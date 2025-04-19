extends Node

const NODE_CONECTION_SCENE: PackedScene = preload("uid://bax452bgxw2wq")

var conections: Array[NodeConection]

func create_conection_between(node_a: BaseNode, node_b: BaseNode, reason: String) -> NodeConection:
	if node_a.is_related_to(node_b):
		print("Ya hay una relacion entre los nodos")
		return

	var new_conection: NodeConection = NODE_CONECTION_SCENE.instantiate()
	new_conection.set_conection_between.call_deferred(node_a, node_b, reason)
	conections.append(new_conection)
	
	return new_conection
