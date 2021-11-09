extends KinematicBody


var Player = null;

var speed = 1

func _physics_process(delta):
	if Player == null:
		Player = get_node_or_null("/root/Game/Player")
	if Player != null:
		look_at(Player.global_transform.origin, Vector3.UP)
		
func _process(delta):
	if Player == null:
		Player = get_node_or_null("/root/Game/Player")
	if Player != null:
		move_and_slide(Player.global_transform.origin - global_transform.origin, Vector3.UP)
