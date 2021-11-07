extends Spatial

onready var Spotlight = $CSGCombiner/Head/Spotlight
onready var Flashlight_Button = $CSGCombiner/Handle/Button 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _unhandled_input(event):
	if Input.is_action_pressed("click") && Spotlight.visible == true:
		Spotlight.hide()
		Spotlight.get_node("Detail").show()
		Flashlight_Button.set_operation(CSGShape.OPERATION_UNION)
		Flashlight_Button.get_node("Off").play()
	elif Input.is_action_pressed("click") && Spotlight.visible == false:
		Spotlight.show()
		Spotlight.get_node("Detail").show()
		Flashlight_Button.set_operation(CSGShape.OPERATION_SUBTRACTION);
		Flashlight_Button.get_node("On").play()
	var position = Vector3()
	

func _process(delta):
	pass
	
