extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_button_pressed():
	get_owner().get_node("Player").canMove = true
	get_owner().get_node("Player").get_node("MovementButtons").visible = true
	get_owner().get_node("Player").get_node("LiveBar").visible = true
	get_owner().get_node("Player").get_node("heart").visible = true
	get_owner().get_node("Player").get_node("heart2").visible = true
	get_owner().get_node("Player").get_node("heart3").visible = true
	queue_free()
