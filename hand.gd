extends Node
@export var player = "P1"
var speed = 10
var velocity = Vector2.ZERO
var inHand = null # werkzeug
var hatInHand = false

func _ready():
	get_node("Label").set_text(player)
	if player == "P1":
		get_node("Sprite2D").flip_h = true

func _process(delta):
	self.position += velocity * speed
	if hatInHand:
		inHand.position = self.position

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
		
	if event.is_action_pressed(player+"-Auf-UndAblegen") && get_node("Area2D").get_overlapping_bodies().size()>0 && inHand == null && !get_node("Area2D").get_overlapping_bodies()[0].inHand :
		inHand = get_node("Area2D").get_overlapping_bodies()[0]
		inHand.InHand()
		hatInHand = true

	elif event.is_action_pressed(player+"-Auf-UndAblegen") && inHand != null:
		inHand.OutHand(self.position)
		inHand = null
		hatInHand = false
