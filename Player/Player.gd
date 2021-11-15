extends KinematicBody

onready var Camera = $Pivot/Camera
onready var Spotlight = $Pivot/Camera/Flashlight/CSGCombiner/Head/Spotlight
onready var Flashlight_Button = $Pivot/Camera/Flashlight/CSGCombiner/Handle/Button

var gravity = -30
var max_speed = 8
var mouse_sensitivity = 0.015
var mouse_range = 1.2

export var itemCount = 0;


var velocity = Vector3()

func _ready(): 
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("forward"):
		input_dir += -Camera.global_transform.basis.z
	if Input.is_action_pressed("back"):
		input_dir += Camera.global_transform.basis.z
	if Input.is_action_pressed("left"):
		input_dir += -Camera.global_transform.basis.x
	if Input.is_action_pressed("right"):
		input_dir += Camera.global_transform.basis.x
	input_dir = input_dir.normalized()
	if Input.is_action_just_pressed("spawn") and !$Debug.current:
		$Debug.current = true;
	elif Input.is_action_just_pressed("spawn") and $Debug.current:
		$Debug.current = false;
	return input_dir

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -mouse_range, mouse_range)
#	if Input.is_action_pressed("click") && Spotlight.visible == true:
#		Spotlight.hide()
#		Spotlight.get_node("Detail").show()
#		Flashlight_Button.set_operation(CSGShape.OPERATION_UNION)
#		Flashlight_Button.get_node("Off").play()
#	elif Input.is_action_pressed("click") && Spotlight.visible == false:
#		Spotlight.show()
#		Spotlight.get_node("Detail").show()
#		Flashlight_Button.set_operation(CSGShape.OPERATION_SUBTRACTION);
#		Flashlight_Button.get_node("On").play()

func _physics_process(delta):
	velocity.y += gravity * delta
	var desired_velocity = get_input() * max_speed
	
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)
	if velocity.x != 0:
		if !$Walk.is_playing():
			$Walk.play()
	elif $Walk.is_playing():
		$Walk.stop()
	if (Global.itemCount >= 4):
		get_tree().change_scene("res://UI/WinScreen.tscn")
	


