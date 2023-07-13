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
	
	if is_movement_action_pressed():
		return PlayerState.States.Moving

	return PlayerState.States.Idle
