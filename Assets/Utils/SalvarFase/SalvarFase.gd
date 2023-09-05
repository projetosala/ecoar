extends Node
export(String, FILE, "*.tscn") var scene
export var lagoPerucaba = false
func _ready():
	if lagoPerucaba and Global.checkpoint == true:
		$Player.position.x = 3720
		$Player.position.y = 48
	var file = File.new()
	if file.file_exists("user://save.dat"):
		Save.local['scene'] = scene
		Save.save_local()
		print("Salva " + Save.local['scene'])
	$CityBanner.visible = true
