extends PlayerState

func input(event):	
	super.input(event)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	return PlayerState.States.Chatting	
