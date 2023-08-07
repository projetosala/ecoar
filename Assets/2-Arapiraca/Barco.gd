extends Area2D
var dialogo_existe = false
export (NodePath) var pl


func _process(delta):
	var dialogue = get_parent().get_node("DialogueBox")
	if dialogue.d_active:
		var pl = get_parent().get_parent().get_parent().get_parent().get_node("Player")
		pl.canMove = false
		pl.get_node("MovementButtons").visible = false 
		pl.get_node("InteractButton").visible = true

func use_dialog():
	var dialogue = get_parent().get_node("DialogueBox")
	
	if dialogue:
		dialogue.start()
		
	
		

func _on_Area2D_body_entered(body) -> void:
	if body.is_in_group("player"):
		use_dialog()
		body.get_node("MovementButtons").visible = false
		body.get_node("InteractButton").visible = true
		body.canMove = false
		body.motion = Vector2(0, 0)
		body.get_node("AnimatedSprite").play("idle")
		
func _on_Area2D_body_exited(body: Player):
	
	queue_free()
