extends Control
class_name BaseNode

var relations: Dictionary[String, BaseNode]

func _ready() -> void:
	NodeSignals.updated_relation.connect(_on_relation_updated)
	NodeSignals.node_created.connect(_on_node_created)
	NodeSignals.node_deleted.connect(_on_node_deleted)

func _on_relation_updated(from_node: BaseNode, new_relation: BaseNode, to_node: BaseNode) -> void: pass

func _on_node_created(new_node: BaseNode, relations: Dictionary[String, BaseNode]) -> void: pass

func _on_node_deleted(node_deleted: BaseNode) -> void: pass

func add_relation() -> void: pass

func delete_relation() -> void: pass
