extends Area


func _on_Item_body_entered(body):
	if(body.name == "Player"):
		Global.itemCount+=1
		print("yessisr!" + str(Global.itemCount))
		queue_free()
