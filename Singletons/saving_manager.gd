extends Node

var node_colors: Dictionary[String, Color] = {
	"related_node": Color(0, 255, 0, 1),
	"unrelated_node": Color(255, 0, 0 , 1),
	"conection_color": Color(0, 0, 0, .6),
	"font_color": Color(1, 1, 1, 1),
	"hover_color": Color(150, 0, 0, 1)
}

func save() -> void: pass
	# Save the actual state

func load_save() -> void: pass
	# Load the last saved state
