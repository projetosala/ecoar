extends Control

export var mutado = false

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


func _on_Options_pressed():
	self.get_node("menu/Player/pause").visible = true


func _on_Mutar_pressed():
	mutado = !mutado
	var bus_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(bus_idx, mutado)
	if mutado:
		$menu/Player/pause/pausada/ColorRect/VBoxContainer/Mutar.text = "Desmutar"
	else:
		$menu/Player/pause/pausada/ColorRect/VBoxContainer/Mutar.text = "Mutar"


func _on_sair_pressed():
	$menu/Player/pause.visible = false


func _on_reiniciar_pressed():
	var file = File.new()
	if file.file_exists("user://save.dat"):
		var dir = Directory.new()
		dir.remove("user://save.dat")
	
