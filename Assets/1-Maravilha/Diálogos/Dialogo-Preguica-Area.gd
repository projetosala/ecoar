extends Area2D

func _process(delta):
	if Dialogic.has_current_dialog_node():
			print("existe")
	else:
		var player = get_parent().get_parent().get_node("Player")
		player.canMove = true
		player.get_node("Buttons").visible = true
		
	

func _on_DialogoPreguicaArea_body_entered(body):
	if body.is_in_group("player"):
		body.get_node("Buttons").visible = false
		body.canMove = false
		body.motion = Vector2(0,0)
		body.get_node("AnimatedSprite").play("idle")
		var dialogo = Dialogic.start("Dialogo-Preguica")
		add_child(dialogo)
		

				


