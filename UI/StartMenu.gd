extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_Button_pressed():
	get_tree().change_scene("res://Maze/Maze.tscn")
	Global.itemCount = 0
