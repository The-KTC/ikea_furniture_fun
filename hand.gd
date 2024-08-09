extends Node
var speed = 2
var velocity = Vector2.ZERO
@export var player = "P1"

func _ready():
	print("loaded, test")
	
func _process(delta):
	self.position += velocity * speed
	

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
	print(velocity)

	#return velocity
	#if event.is_action_released("P1-Down"):
	#velocity=Vector2.ZERO
