extends Node3D

@onready var player = $RoomPlayer

func _ready():
	if global.woke_up == 0:
		player.open_dialog("Erin", "Good morning, nobody!")
		global.woke_up = 1
