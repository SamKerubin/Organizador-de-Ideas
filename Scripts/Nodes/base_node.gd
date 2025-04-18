extends Control
class_name BaseNode

@export var info: NodeInfo = load("res://Resoruces/Nodes/node_info.tres").duplicate()

@onready var info_button: Button = $Button
@onready var node_color: ColorRect = $ColorRect

var relations: Array[NodeRelation]

func _ready() -> void:
	NodeManager.node_deleted.connect(_on_node_deleted)
	update_visible_state()

func _on_node_deleted(node_to_delete: BaseNode) -> void:
	remove_relation_with(node_to_delete)

func _on_button_pressed() -> void:
	NodeInfoManager.show_node_info(self)

func is_related_to(other_node: BaseNode) -> bool:
	return relations.find(func(x: NodeRelation) -> bool:
		return x.get_related_node() == other_node
	) != -1

func remove_relation_with(n: BaseNode) -> void:
	relations = relations.filter(func(x: NodeRelation) -> bool: 
		return x.get_related_node() != n
	)

	update_visible_state()

func update_visible_state() -> void:
	info_button.text = info.name
	# Update conections too

func get_relations() -> Array[NodeRelation]:
	return relations
