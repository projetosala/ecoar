extends Node
export(String, FILE, "*.tscn") var scene
func _ready():
	var file = File.new()
	if !file.file_exists("user://save.dat"):
		Save.local['scene'] = scene
		Save.save_local()
		print("Salvo" + Save.local['scene'])
