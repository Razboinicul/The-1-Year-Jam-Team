extends PlayerState

func input(event):
	super.input(event)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	look_around(event)
	
	if is_movement_action_pressed():
		return PlayerState.States.Moving

	return PlayerState.States.Idle

func is_movement_action_pressed() -> bool:
	return(
		Input.is_action_pressed("forward") or 
		Input.is_action_pressed("backward") or
		Input.is_action_pressed("left") or 
		Input.is_action_pressed("right")
	)
