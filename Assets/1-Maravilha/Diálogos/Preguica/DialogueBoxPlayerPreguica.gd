extends CanvasLayer

export (String, FILE, "*.json") var d_file
export(String, FILE, "*.tscn") var world_scene

var dialogue = []
var current_dialog_id = 0
var d_active = false
export var dialogofinal = false

func _ready():
	$NinePatchRect.visible = false
	
func start():
	if d_active:
		return
	d_active = true
	$NinePatchRect.visible = true
	
	dialogue = load_dialogue()
	current_dialog_id = -1
	next_script()
	

func load_dialogue():
	var file = File.new()
	if file.file_exists(d_file):
		file.open(d_file, File.READ)
		return parse_json(file.get_as_text())
		
func _input(event):
	if not d_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()

func next_script():
	current_dialog_id += 1
	if current_dialog_id >= len(dialogue):
		$Timer.start()
		$NinePatchRect.visible = false
		return
	
	$NinePatchRect/Name.text = dialogue[current_dialog_id]["name"]
	$NinePatchRect/Text.text = dialogue[current_dialog_id]["text"]
	
	

func _on_Timer_timeout():
	var barco = get_parent().get_parent().get_node("AnimationPlayer")
	var boss = get_parent().get_node("boss")
	var pl = get_parent().get_parent().get_parent().get_parent().get_node("Player")
	if barco:
		barco.play("barco-anim")
	var mototaxi = get_parent().get_node("Mototaxi")
	if mototaxi:
		SceneTransition.change_scene("dissolve")
		get_tree().change_scene(world_scene)
	if boss:
		boss.play("run")
		boss.flip_h = false
		get_parent().get_node("AnimationPlayer").play("vilao-saindo")
		SceneTransition.change_scene("dissolve")
		boss.queue_free()
	if dialogofinal:
		var file = File.new()
		if file.file_exists("user://save.dat"):
			var dir = Directory.new()
			dir.remove("user://save.dat")
		get_tree().change_scene("res://Assets/Menu/Creditos.tscn")
		
	pl.canMove = true
	pl.get_node("MovementButtons").visible = true 
	pl.get_node("InteractButton").visible = false
	d_active = false
	
func funcaoDestruirBoss():
		get_parent().get_node("boss").queue_free()

	
