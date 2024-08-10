extends RigidBody2D
var gravity = 1
var states = null

func InHand():
	self.gravity_scale = 0

func OutHand(vec):
	if states != null:
		self.gravity_scale = 1
		states.transform.origin = vec


func _integrate_forces(state):
	states = state
