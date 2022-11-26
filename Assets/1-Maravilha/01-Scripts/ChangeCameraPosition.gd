extends Area2D

var bodySaiu = false

func _on_ChangeCameraPosition_body_entered(body):
	bodySaiu = false
	if body.is_in_group("player"):
		var camera = body.get_node("Camera")
		var buttons = body.get_node("Buttons")
		while camera.offset.y < 1:
			if bodySaiu == true: 
				break
			yield(get_tree().create_timer(0.000001), "timeout")
			camera.offset.y += 4.5
			buttons.position.y += 4.5
			
			

func _on_ChangeCameraPosition_body_exited(body):
	bodySaiu = true
	if body.is_in_group("player"):
		var camera = body.get_node("Camera")
		var buttons = body.get_node("Buttons")
		while camera.offset.y > -47:
			yield(get_tree().create_timer(0.000001), "timeout")
			camera.offset.y -= 3
			buttons.position.y -= 3
