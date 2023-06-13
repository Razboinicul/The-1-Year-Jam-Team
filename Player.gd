extends KinematicBody
export var SPEED = 10

func _process(delta):
	var velocity = Vector3.ZERO
	if Input.is_action_pressed("forward"): velocity += transform.basis.z * SPEED
	if Input.is_action_pressed("backward"): velocity -= transform.basis.z * SPEED
	if Input.is_action_pressed("right"): velocity += transform.basis.x * SPEED
	if Input.is_action_pressed("left"): velocity -= transform.basis.x * SPEED
	move_and_slide(velocity, Vector3.UP)
