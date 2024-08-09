extends Node
var speed = 2
var velocity = Vector2.ZERO
@export var player = "P1"
var aufnehmbar = false
var object = null

func _ready():
	print("loaded, test")

func _process(delta):
	self.position += velocity * speed
	if get_node("Area2D").get_overlapping_bodies().size()>0 && aufnehmbar:
		var object = get_node("Area2D").get_overlapping_bodies()[0]
		#print(object)
		object.position = self.global_position
		object.setGravity(false)
	elif object!=null:
		object.setGravity(true)
		


func _input(event):
	if event.is_action_pressed(player+"-Up"):
		velocity+=Vector2(0,-1)
	if event.is_action_pressed(player+"-Left"):
		velocity+=Vector2(-1,0)
	if event.is_action_pressed(player+"-Down"):
		velocity+=Vector2(0,1)
	if event.is_action_pressed(player+"-Right"):
		velocity+=Vector2(1,0)
		
	if event.is_action_released(player+"-Up"):
		velocity+=Vector2(0,1)
	if event.is_action_released(player+"-Left"):
		velocity+=Vector2(1,0)
	if event.is_action_released(player+"-Down"):
		velocity+=Vector2(0,-1)
	if event.is_action_released(player+"-Right"):
		velocity+=Vector2(-1,0)
		
	if event.is_action_pressed(player+"-Auf-UndAblegen"):
		aufnehmbar= !aufnehmbar
		print(aufnehmbar)


