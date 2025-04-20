extends Control
class_name BaseNode

@export var info: NodeInfo = load("res://Resoruces/Nodes/node_info.tres").duplicate()

@onready var draggable_component: DraggableComponent = $DraggableComponent
@onready var node_color: ColorRect = $ColorRect
@onready var node_name: RichTextLabel = $ColorRect/RichTextLabel

var relations: Array[NodeRelation]

func _ready() -> void:
	NodeManager.node_deleted.connect(_on_node_deleted)

	update_visible_state()

#region Signals
func _on_node_deleted(node_to_delete: BaseNode) -> void:
	remove_relation_between(node_to_delete)

func _on_component_clicked() -> void:
	show_info()

func _node_is_being_dragged_to(offset: Vector2) -> void:
	NodeConnectionManager.node_is_being_dragged.emit(self)
	global_position = offset

func _on_mouse_hover(is_hovered: bool) -> void:
	if is_hovered: 
		if not have_any_relation(): node_color.color = Color.WEB_MAROON
		else: node_color.color = Color.DARK_GREEN
	else: set_node_color()
#endregion

#region Node Relations
func is_related_to(other_node: BaseNode) -> bool:
	return get_relations().find(func(x: NodeRelation) -> bool:
		return x.get_related_node() == other_node
	) != -1

func add_relation_with(n: BaseNode, reason: String) -> void:
	if is_related_to(n): 
		print("Ya hay una relacion con este nodo")
		return

	var self_node_relation: NodeRelation = NodeRelation.new(n, reason)
	var other_node_relation: NodeRelation = NodeRelation.new(self, reason)
	
	relations.append(self_node_relation)
	n.relations.append(other_node_relation)

	update_visible_state()

func remove_relation_between(n: BaseNode) -> void:
	relations = relations.filter(func(x: NodeRelation) -> bool: 
		return x.get_related_node() != n
	)

	n.relations = n.relations.filter(func(x: NodeRelation) -> bool: 
		return x.get_related_node() != self
	)

	update_visible_state()
	n.update_visible_state()

func remove_all_relations() -> void:
	for relation: NodeRelation in get_relations():
		remove_relation_between(relation.get_related_node())

func get_relation_with(other_node: BaseNode) -> NodeRelation:
	for relation: NodeRelation in get_relations():
		print(relation.get_related_node().info.name)
		if relation.get_related_node() == other_node:
			return relation

	return null

func get_relations() -> Array[NodeRelation]:
	return relations

func have_any_relation() -> bool:
	return relations != []
#endregion

#region Visible Node States
func update_visible_state() -> void:
	node_name.text = info.name
	set_node_color()

func set_node_color() -> void:
	if not have_any_relation(): 
		node_color.color = SavingManager.node_colors["unrelated_node"]
	else: node_color.color = SavingManager.node_colors["related_node"]

	var font_color: String = "#" + SavingManager.node_colors["font_color"].to_html()
	node_name.text = ("[color=%s]" % font_color) + node_name.text + "[/color]"
#endregion

func show_info() -> void:
	NodeInfoManager.show_node_info(self)

static func get_default_position(center: Vector2=Vector2.ZERO, radius: float=100) -> Vector2:
	var angle: float = randf() * TAU
	return center + Vector2(cos(angle), sin(angle))
