extends Node
class_name PlayerState

enum States { Null, Idle, Chatting, Moving }

@onready var player: Player = get_owner()

func input(event):
	return States.Null
	
func process(delta):
	return States.Null

func look_around(event):
	if event is InputEventMouseMotion:
		player.rotate_y(deg_to_rad(-event.relative.x * player.mouse_sens))
		var changev =- event.relative.y * player.mouse_sens
		if player.camera_anglev + changev >- 50 and player.camera_anglev + changev < 50:
			player.camera_anglev += changev
			player.camera_3d.rotate_x(deg_to_rad(changev))
