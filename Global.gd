extends Node


export var itemCount = 0;

func _ready():
	OS.set_window_fullscreen(!OS.window_fullscreen)

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		var menu = get_node_or_null("/root/Game/Menu")
		if menu != null:
			if not menu.visible:
				menu.show()
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				get_tree().paused = true
			else:
				menu.hide()
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				get_tree().paused = false
