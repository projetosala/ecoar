extends Area2D

func _input(event):
	if event.is_action_pressed("ui_accept") and len(get_overlapping_bodies()) > 0:
		print("cocota")
		use_dialog()



func use_dialog():
	var dialogue = get_parent().get_node("DialogueBox")
	
	if dialogue:
		dialogue.start()
