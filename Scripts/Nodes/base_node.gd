extends Control
class_name BaseNode


@export var info: NodeInfo = load("res://Resoruces/Nodes/node_info.tres").duplicate()

@onready var node_name: RichTextLabel = $ColorRect/RichTextLabel
@onready var node_color: ColorRect = $ColorRect
@onready var node_panel: BaseNodePanel = $Panel

var relations: Array[NodeRelation]

func _ready() -> void:
	NodeManager.node_deleted.connect(_on_node_deleted)
	node_panel.node = self
	update_visible_state()

func _on_node_deleted(node_to_delete: BaseNode) -> void:
	remove_relation_with(node_to_delete)

func show_info() -> void:
	NodeInfoManager.show_node_info(self)

func is_related_to(other_node: BaseNode) -> bool:
	return relations.find(func(x: NodeRelation) -> bool:
		return x.get_related_node() == other_node
	) != -1

func add_relation_with(n: BaseNode, reason: String) -> void:
	if is_related_to(n): 
		print("Ya hay una relacion con este nodo")
		return

	var new_relation: NodeRelation = NodeRelation.new()
	new_relation.node_related = n
	new_relation.reason = reason

	relations.append(new_relation)

	update_visible_state()

func remove_relation_with(n: BaseNode) -> void:
	relations = relations.filter(func(x: NodeRelation) -> bool: 
		return x.get_related_node() != n
	)

	update_visible_state()

func update_visible_state() -> void:
	node_name.text = info.name
	# Update conections too
	set_node_color()

func set_node_color() -> void:
	if relations == []: node_color.color = SavingManager.node_colors["unrelated_node"]
	else: node_color.color = SavingManager.node_colors["related_node"]
	
	var font_color: String = "#" + SavingManager.node_colors["font_color"].to_html()
	node_name.text = ("[color=%s]" % font_color) + node_name.text + "[/color]" 

func get_relations() -> Array[NodeRelation]:
	return relations

static func get_default_position(center: Vector2=Vector2.ZERO, radius: float= 100) -> Vector2:
	var angle: float = randf() * TAU
	return center + Vector2(cos(angle), sin(angle))
