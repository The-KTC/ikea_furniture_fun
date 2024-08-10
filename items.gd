extends CharacterBody2D
var gravity = 100
var fall = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor() && fall:
		velocity.y += gravity * delta
		move_and_slide()

func InHand():
	fall = false

func OutHand():
	fall = true

