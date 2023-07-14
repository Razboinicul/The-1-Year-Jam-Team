extends Node

@onready var states = {  
	PlayerState.States.Idle: $Idle, 
	PlayerState.States.Chatting: $Chatting,
	PlayerState.States.Moving: $Moving,
}

@onready var current_state: PlayerState 

var player : Player

func init_state(player: Player):
	player = player
	change_state(PlayerState.States.Idle)

func change_state(state: int):
	if not state: return
		
	var new_state = states[state]
	if new_state and current_state != new_state:
		if current_state: current_state.exit()
		current_state = states[state]
		current_state.enter()
	
func input(event):	
	change_state(current_state.input(event))

func process(delta):
	change_state(current_state.process(delta))
	
func look_around(event):
	if event is InputEventMouseMotion:
		player.rotate_y(deg_to_rad(-event.relative.x * player.mouse_sens))
		var changev =- event.relative.y * player.mouse_sens
		if player.camera_anglev + changev >- 60 and player.camera_anglev + changev < 60:
			player.camera_anglev += changev
			player.camera_3d.rotate_x(deg_to_rad(changev))

func detect_interactable():
	var collider = player.interact_ray.get_collider()
	if collider is Interactable:
		player.enable_interaction(collider)
	else:
		player.disable_interaction()
