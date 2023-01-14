extends Node

var save_path: String = "user://save.dat"

var local = {
	"scene": "",
}

func save_local() -> void:
	var file: File = File.new()
	var abrir = file.open(save_path, File.WRITE)
	if abrir == OK:
		file.store_var(local)
		file.close()
		
		
func load_local() -> void:
	var file: File = File.new()
	if file.file_exists(save_path):
		var abrir = file.open(save_path, File.READ)
		if abrir == OK:
			local = file.get_var()
			file.close()
