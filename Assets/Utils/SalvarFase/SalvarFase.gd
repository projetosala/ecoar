extends Node2D
export(String, FILE, "*.tscn") var scene
func _ready():
	var file = File.new()
	if file.file_exists("user://save.dat"):
		Save.local['scene'] = scene
		Save.save_local()
		print("Salva " + Save.local['scene'])
	$CityBanner.visible = true
