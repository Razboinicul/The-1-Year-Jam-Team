extends PlayerState

func enter():
	super.enter()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func input(event):	
	super.input(event)
	look_around(event)
	detect_interactable()
	
	if interacted():
		interact()
		return PlayerState.States.Chatting
		
	return PlayerState.States.Moving
			
func process(delta):
	var velocity = Vector3.ZERO
	
	if Input.is_action_pressed("forward"): velocity -= player.transform.basis.z 
	if Input.is_action_pressed("backward"): velocity += player.transform.basis.z 
	if Input.is_action_pressed("right"): velocity += player.transform.basis.x 
	if Input.is_action_pressed("left"): velocity -= player.transform.basis.x 
	
	player.set_velocity(velocity.normalized() * player.speed)
	player.set_up_direction(Vector3.UP)
	player.move_and_slide()
	
	if velocity == Vector3.ZERO:
		return PlayerState.States.Idle
	
	return PlayerState.States.Moving
