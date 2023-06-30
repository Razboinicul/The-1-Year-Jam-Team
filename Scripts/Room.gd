extends Node3D

func _ready():
	if global.woke_up == 0:
		var dialog = preload("res://Scenes/Dialogue.tscn").instantiate()
		dialog.CharacterName = "Erin"
		dialog.Text = "Good morning, nobody!"
		add_child(dialog)
		global.woke_up = 1
