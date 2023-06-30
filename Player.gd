extends CharacterBody3D
@export var SPEED = 10
var mouse_sens = 0.3
var camera_anglev=0

func _input(event):
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x*mouse_sens))
		var changev=-event.relative.y*mouse_sens
		if camera_anglev+changev>-50 and camera_anglev+changev<50:
			camera_anglev+=changev
			$Camera3D.rotate_x(deg_to_rad(changev))


func _process(delta):
	var velocity = Vector3.ZERO
	if Input.is_action_pressed("forward"): velocity -= transform.basis.z * SPEED
	if Input.is_action_pressed("backward"): velocity += transform.basis.z * SPEED
	if Input.is_action_pressed("right"): velocity += transform.basis.x * SPEED
	if Input.is_action_pressed("left"): velocity -= transform.basis.x * SPEED
	set_velocity(velocity)
	set_up_direction(Vector3.UP)
	move_and_slide()
	
