extends Panel
class_name BaseNodePanel

const MAX_CLICK_DISTANCE: float = 5
const MAX_CLICK_TIME: float = .8

var node: BaseNode

var hover: bool = false
var clicked: bool = false
var dragging: bool = false

var click_time: float = 0.0

var click_start_pos: Vector2 = Vector2.ZERO
var drag_offset: Vector2 = Vector2.ZERO

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed and hover:
				clicked = true
				click_start_pos = get_viewport().get_mouse_position()
				click_time = Time.get_ticks_msec() / 1000
				drag_offset = get_viewport().get_mouse_position() - global_position

			if not event.pressed and clicked:
				var release_pos: Vector2 = get_viewport().get_mouse_position()
				var release_time: float = Time.get_ticks_msec() / 1000

				var time_dif: float = release_time - click_time
				var dist: float = click_start_pos.distance_to(release_pos)

				clicked = false
				dragging = false

				if dist < MAX_CLICK_DISTANCE and time_dif < MAX_CLICK_TIME:
					node.show_info()
	elif event is InputEventMouseMotion and clicked:
		if not dragging:
			if click_start_pos.distance_to(get_viewport().get_mouse_position()) > MAX_CLICK_DISTANCE:
				dragging = true

		if dragging:
			mouse_default_cursor_shape = 6
			node.global_position = get_viewport().get_mouse_position() - drag_offset

	elif event is InputEventMouseMotion and dragging:
		node.global_position = get_viewport().get_mouse_position() - drag_offset

func _on_mouse_entered() -> void:
	mouse_default_cursor_shape = 2
	hover = true
	node.node_color.color = Color.WEB_MAROON

func _on_mouse_exited() -> void:
	hover = false
	node.set_node_color()
