extends Control

func _ready() -> void:
	NodeManager.create_node("node-1", "something", self)
