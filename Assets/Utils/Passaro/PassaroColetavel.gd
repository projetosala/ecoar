extends Area2D




func _on_PassaroColetavel_body_entered(body):
	if body.name == "Player":
		get_parent().get_node("Info-Passaro").visible = true
		body.canMove = false
		body.motion.x = 0
		body.motion.y = 0
		body.get_node("MovementButtons").visible = false
		body.get_node("LiveBar").visible = false
		body.get_node("heart").visible = false
		body.get_node("heart2").visible = false
		body.get_node("heart3").visible = false
		queue_free()

