extends Area2D
export(String, FILE, "*.tscn") var world_scene

export var checkpoint = false
export var lagoPerucaba = false
export var checkpointPositionX = 0
export var checkpointPositionY = 0

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			if checkpoint:
				SceneTransition.change_scene("dissolve")
				body.life = 3
				Global.checkpoint = true
				body.get_node("heart2").play("heart")
				body.get_node("heart").play("heart")
				if lagoPerucaba:
					get_tree().reload_current_scene()
				else:
					body.position.x = checkpointPositionX
					body.position.y = checkpointPositionY
			else:
				SceneTransition.change_scene("dissolve")
				get_tree().change_scene(world_scene)
			
			
	

func _on_Area2D2_body_entered(body):
	queue_free()
