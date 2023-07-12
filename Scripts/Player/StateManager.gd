extends Node

@onready var states = {  
	PlayerState.States.Idle: $Idle, 
	PlayerState.States.Chatting: $Chatting,
	PlayerState.States.Moving: $Moving,
}

@onready var current_state: PlayerState

func init_state(player: Player):
	change_state(PlayerState.States.Idle)

func change_state(state: int):
	if not state: return
		
	var new_state = states[state]
	if new_state and current_state != new_state:
		print("change to: %s" % new_state)
		current_state = states[state]
	
func input(event):
	change_state(current_state.input(event))

func process(delta):
	change_state(current_state.process(delta))
	

