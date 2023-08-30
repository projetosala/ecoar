extends Node2D

export var mutado = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Mutar_pressed():
	mutado = !mutado
	if mutado:
		AudioServer.set_stream_global_volume_scale(0)
	else:
		AudioServer.set_stream_global_volume_scale(1.0)
