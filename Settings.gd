extends Node2D
var pause = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("fortsetzen").set_process_mode(Node.PROCESS_MODE_ALWAYS)
	get_node("Menu").set_process_mode(Node.PROCESS_MODE_ALWAYS)
	
func _on_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://start.tscn")

func _input(event):
	if event.is_action_pressed("escape"):
		self.visible = !self.visible
		#if get_node("../Zeitangabe") != null:
		#	get_node("../Zeitangabe").flipfloptime()
		pause = !pause
		get_tree().paused = pause

func _on_fortsetzen_pressed():
	self.visible = !self.visible
	pause = !pause
	get_tree().paused = pause
