extends Control
class_name NodeConection

@onready var conection_line: Line2D = $Panel/Line2D

var node_1: BaseNode
var node_2: BaseNode
var reason: String = ""

func set_conection_between(node_a: BaseNode, node_b: BaseNode, reason: String) -> void:
	node_1 = node_a
	node_2 = node_b
	self.reason = reason

	point()

func point() -> void:
	conection_line.clear_points()
	conection_line.add_point(node_1.draggable_component.global_position + node_1.draggable_component.size / 1.7)
	conection_line.add_point(node_2.draggable_component.global_position + node_2.draggable_component.size / 1.7)

func _on_mouse_entered() -> void:
	print(reason)
