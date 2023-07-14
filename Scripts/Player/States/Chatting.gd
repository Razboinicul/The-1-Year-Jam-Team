extends PlayerState

func enter():
	super.enter()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	player.interactable = null

func input(event):	
	super.input(event)
	return PlayerState.States.Chatting	
