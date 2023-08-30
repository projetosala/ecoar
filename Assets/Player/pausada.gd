extends Control

func _ready():
	self.pause_mode = Node.PAUSE_MODE_PROCESS

func _on_voltar_pressed():
	get_tree().paused = false
	self.visible = false
	



func _on_sair_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Assets/Menu/Start.tscn")
