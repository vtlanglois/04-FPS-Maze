extends Control



func _process(_delta):
	$Label.text = "Items: " + str(Global.itemCount) + "/4"
	
func _on_Restart_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Maze/Maze.tscn")

func _on_Quit_pressed():
	get_tree().quit()
