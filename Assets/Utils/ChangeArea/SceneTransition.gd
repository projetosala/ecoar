extends CanvasLayer

func change_scene() -> void:
	$AnimationPlayer.play_backwards("dissolve")
	yield($AnimationPlayer,"animation_finished")

	

