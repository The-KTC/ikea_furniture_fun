extends Node2D
var needToPlayTutorial = false

func _ready():
	ladeStatus()
	if needToPlayTutorial:
		speichereZeit()
		get_tree().change_scene_to_file("res://tutorial.tscn")
func _process(delta):
	pass
func _on_button_pressed():
	get_tree().change_scene_to_file("res://levelSelector.tscn")

func speichereZeit():
	var file = FileAccess.open("tutorial.save", FileAccess.WRITE)
	file.store_var(true)
	file.close()

func ladeStatus():
	if FileAccess.file_exists("tutorial.save"):
		needToPlayTutorial = false
	else:
		needToPlayTutorial = true

func _input(event):
	if event.is_action_pressed("removeTime"): # minus-taste // repräsentiert, dass das tutorial erneut angezeigt wird
		resetteTutorial()
		needToPlayTutorial = true
		_ready()
		
func resetteTutorial():
	var dir = DirAccess.open("res://")
	if dir.file_exists("tutorial.save"):
		dir.remove("tutorial.save")
		print("Datei erfolgreich gelöscht!")
	else:
		print("Datei existiert nicht.")


func _on_button_2_pressed():
	resetteTutorial()
	needToPlayTutorial = true
	_ready()
