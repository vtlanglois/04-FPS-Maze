extends Node

func _ready():
	OS.set_window_fullscreen(!OS.window_fullscreen)

func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		get_tree().quit()
