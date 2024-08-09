extends RigidBody2D
var gravity = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# if abfrage - worldboarder erreicht?
	# x-achse wird verringert
	pass

func setGravity(boolean):
	self.gravity = boolean
	print("Gravity switched?")
