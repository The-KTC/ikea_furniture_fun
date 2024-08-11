extends Node2D
var zeit = 0.0
var label = null
var bestTime = null
var besteZeit = 0.0
#var zeitLaeuft = true
# Called when the node enters the scene tree for the first time.
func _ready():
	label = get_node("Label")
	bestTime = get_node("bestTime")
	ladeZeit()
	#$Timer.start()
	
func _process(delta):
#	if zeitLaeuft:
	zeit += delta
	label.text ="Time: "+ String("%.2f" % zeit)
	bestTime.text ="Best time: "+ String("%.2f" % besteZeit)

func _input(event):
	if event.is_action_pressed("saveTime"): # plus-taste, Joshua
		speichereZeit()
		ladeZeit()
	if event.is_action_pressed("removeTime"): # minus-taste
		resetteZeit()

func speichereZeit():
	var file = FileAccess.open("besteZeit.save", FileAccess.WRITE)
	file.store_float(zeit)
	file.close()

func ladeZeit():
	if FileAccess.file_exists("besteZeit.save"):
		var file = FileAccess.open("besteZeit.save", FileAccess.READ)
		besteZeit = file.get_float()
		file.close()
		
func resetteZeit():
	var dir = DirAccess.open("res://")
	if dir.file_exists("besteZeit.save"):
		dir.remove("besteZeit.save")
		print("Datei erfolgreich gelöscht!")
		besteZeit = 0.0
	else:
		print("Datei existiert nicht.")
		
#func flipfloptime():
#	zeitLaeuft = !zeitLaeuft
