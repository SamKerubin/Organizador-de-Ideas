extends Control
class_name BaseNode

@export var info: NodeInfo = load("res://Resoruces/Nodes/node_info.tres").duplicate()

@onready var info_button: Button = $Button
@onready var node_color: ColorRect = $ColorRect

var relations: Array[NodeRelation]

func _on_button_pressed() -> void:
	NodeInfoManager.show_node_info(self)

func remove_relation_with(n: BaseNode) -> void:
	relations = relations.filter(func(x: BaseNode) -> bool: 
		return x.get_related_node() != n
	)

func get_relations() -> Array[NodeRelation]:
	return relations
