extends Node

var node_colors: Dictionary[String, Color] = {
	"related_node": Color.GREEN,
	"unrelated_node": Color.RED,
	"conection_color": Color(0, 0, 0, .6),
	"font_color": Color.WHITE,
	"hover_color": Color.DARK_RED
}

func save() -> void: pass
	# Save the actual state

func load_save() -> void: pass
	# Load the last saved state
