extends Control

func _ready():
	$controls/StartEnter.grab_focus()


func _on_StartEnter_pressed():
	var file = File.new()
	if file.file_exists("user://save.dat"):
		Save.load_local()
		print(Save.local['scene'])
		get_tree().change_scene(Save.local['scene'])
	else:
		get_tree().change_scene("res://Assets/1-Maravilha/1-Cidade.tscn")

func _on_quitEnter_pressed():
	get_tree().quit()
