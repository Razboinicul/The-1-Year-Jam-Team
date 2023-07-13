extends Node
class_name PlayerState

enum States { Null, Idle, Chatting, Moving }

@onready var player: Player = get_owner()

func input(event):
	return States.Null
	
func process(delta):
	return States.Null
	
func enter():
	pass
	
func exit():
	pass
	
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
		player.interactable = collider
	else:
		player.interactable = null
	
func interact():	
	player.interactable.interact(player)

func clear_interactable():
	player.interactable = null


func interacted() -> bool:
	return Input.is_action_pressed("Interact") and player.interactable

func is_movement_action_pressed() -> bool:
	return(
		Input.is_action_pressed("forward") or 
		Input.is_action_pressed("backward") or
		Input.is_action_pressed("left") or 
		Input.is_action_pressed("right")
	)
