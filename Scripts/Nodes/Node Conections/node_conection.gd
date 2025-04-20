extends Control
class_name NodeConnection

@onready var panel: Panel = $Line2D/Panel
@onready var connection_line: Line2D = $Line2D

var node_1: BaseNode
var node_2: BaseNode
var reason: String = ""

func _ready() -> void:
	NodeConnectionManager.node_is_being_dragged.connect(_node_is_being_dragged)
	NodeManager.node_deleted.connect(_on_node_deleted)

#region Signals
func _node_is_being_dragged(some_node: BaseNode) -> void:
	if some_node != node_1 and some_node != node_2: return

	point()

func _on_node_deleted(deleted_node: BaseNode) -> void:
	for relation: NodeRelation in deleted_node.get_relations():
		NodeConnectionManager.delete_connection_between(deleted_node, relation.get_related_node())

func _on_mouse_entered() -> void:
	print(reason)
#endregion

#region Connections
func set_connection_between(node_a: BaseNode, node_b: BaseNode, reason: String) -> void:
	node_1 = node_a
	node_2 = node_b
	self.reason = reason

	point()

func have_one_node_connected(node: BaseNode) -> bool:
	return node == node_1 or node == node_2

func connected_to(node_a: BaseNode, node_b: BaseNode) -> bool:
	return have_one_node_connected(node_a) and have_one_node_connected(node_b)
#endregion

func point() -> void:
	connection_line.clear_points()
	
	var x: Vector2 = node_1.draggable_component.global_position + node_1.draggable_component.size / 2
	var y: Vector2 = node_2.draggable_component.global_position + node_2.draggable_component.size / 2
	connection_line.add_point(x)
	connection_line.add_point(y)

	panel.size.x = x.distance_to(y)

	var new_position: Vector2 = (x + y) / 2
	panel.global_position = new_position - panel.size / 2
	print("NP", new_position)
	print("PS", panel.size / 2)
	print("PGP", panel.global_position, "\n")
	panel.rotation = abs(y - x).angle()
	
