extends KinematicBody


var Player = null;

var move_speed = 100

func _physics_process(delta):
	if Player == null:
		Player = get_node_or_null("/root/Game/Player")
	if Player != null:
		look_at(Player.global_transform.origin, Vector3.UP)
		
func _process(delta):
	if Player == null:
		Player = get_node_or_null("/root/Game/Player")
	if Player != null:
		#move_and_slide_with_snap(Player.global_transform.origin - global_transform.origin, Vector3.UP)
		# you get the position of the player
		var player_origin = Player.get_global_transform().origin

# you get the position of the enemy
		var enemy_origin = get_global_transform().origin

# when you subtract enemy from player, what you get is kind of like the _direction_ towards the player, which we will store in offset
		var offset = player_origin - enemy_origin

# normalize offset so that it is a Vector of length 1
# multiply by our move speed and by delta

		move_and_slide(offset.normalized() * move_speed * delta)
