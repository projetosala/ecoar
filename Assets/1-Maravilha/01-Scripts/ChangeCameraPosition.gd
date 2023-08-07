extends Area2D

var bodySaiu = false
var heart1
var heart2
var heart3
var livebutton
var interactButton

func _on_ChangeCameraPosition_body_entered(body):
	bodySaiu = false
	if body.is_in_group("player"):
		var camera = body.get_node("Camera")
		var buttons = body.get_node("MovementButtons")
	
		if body.get_node("LiveBar"):
			livebutton = body.get_node("LiveBar")
			heart1 = body.get_node("heart")
			heart2 = body.get_node("heart2")
			heart3 = body.get_node("heart3")
		if body.get_node("InteractButton"):
			interactButton = body.get_node("InteractButton")
		while camera.offset.y < 1:
			if bodySaiu == true: 
				break
			yield(get_tree().create_timer(0.000001), "timeout")
			camera.offset.y += 4.5
			buttons.position.y += 4.5
			livebutton.position.y += 4.5
			heart1.position.y += 4.5
			heart2.position.y += 4.5
			heart3.position.y += 4.5
			interactButton.position.y += 4.5
func _on_ChangeCameraPosition_body_exited(body):
	bodySaiu = true
	if body.is_in_group("player"):
		var camera = body.get_node("Camera")
		var buttons = body.get_node("MovementButtons")
		while camera.offset.y > -47:
			yield(get_tree().create_timer(0.000001), "timeout")
			camera.offset.y -= 3
			buttons.position.y -= 3
			if body.get_node("LiveBar"):
				livebutton.position.y -= 3
				heart1.position.y -= 3
				heart2.position.y -= 3
				heart3.position.y -= 3
				interactButton.position.y -=3
		
