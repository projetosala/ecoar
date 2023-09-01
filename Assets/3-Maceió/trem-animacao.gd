extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_tremanimacao_body_entered(body):
	if body.name == "Player":
		SceneTransition.change_scene("dissolve")
		body.visible = false
		body.canMove = false
		body.motion.y = 0
		body.motion.x = 0
		get_parent().get_node("Trem/AnimationPlayer").play("trem")
		var timer := Timer.new()
		add_child(timer)
		timer.wait_time = 5.0
		timer.one_shot = true
		timer.start()
		timer.connect("timeout", self, "_on_timer_timeout")

func _on_timer_timeout() -> void:
	get_tree().change_scene("res://Assets/3-Maceió/Orla.tscn")
