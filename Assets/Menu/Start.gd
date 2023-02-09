extends Control


func _on_StartEnter_pressed():
	var file = File.new()
	if file.file_exists("user://save.dat"):
		Save.load_local()
		print(Save.local['scene'])
		get_tree().change_scene(Save.local['scene'])
	else:
		get_tree().change_scene("res://Assets/1-Maravilha/1-Cidade.tscn")


func _on_CreditsEnter_pressed():
	get_tree().change_scene("res://Assets/Menu/Creditos.tscn")


func _on_QuitEnter_pressed():
	get_tree().quit()
