extends Area2D
var dialogo_existe = false
export (NodePath) var pl


func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			var dialogue = get_parent().get_node("DialogueBox")
			use_dialog()
			if dialogue.d_active:
				pl = get_parent().get_parent().get_parent().get_parent().get_node("Player")
				pl.canMove = false
				pl.get_node("MovementButtons").visible = false 
				pl.get_node("InteractButton").visible = true

func use_dialog():
	var dialogue = get_parent().get_node("DialogueBox")
	
	if dialogue:
		dialogue.start()
		
