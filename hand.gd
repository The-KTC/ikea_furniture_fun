extends Node
var speed = 10
var velocity = Vector2.ZERO
@export var player = "P1"

var inHand = null
var HandOffset = Vector2.ZERO

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
		
	if event.is_action_pressed(player+"-Auf-UndAblegen") && get_node("Area2D").get_overlapping_bodies().size()>0 && inHand == null:
		inHand = get_node("Area2D").get_overlapping_bodies()[0]
		inHand.InHand()
		HandOffset = self.global_position - inHand.global_position
		inHand.get_parent().remove_child(inHand)
		self.add_child(inHand)
		inHand.position = Vector2.ZERO
	elif event.is_action_pressed(player+"-Auf-UndAblegen") && inHand != null:
		self.remove_child(inHand)
		get_parent().add_child(inHand)
		inHand.OutHand()
		inHand.position = self.position
		inHand = null


