extends CanvasLayer

func change_scene(animation) -> void:
	$AnimationPlayer.play_backwards(animation)
	yield($AnimationPlayer,"animation_finished")

	

