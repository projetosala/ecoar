extends CanvasLayer

export (String) var texto

func _ready():
	$Node2D/NinePatchRect/Name.text = texto
	$AnimationPlayer.play("entrada")
