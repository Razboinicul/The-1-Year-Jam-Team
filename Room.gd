extends Spatial

func _ready():
	if global.woke_up == 0:
		var d = preload("res://Dialogue.tscn").instance()
		d.CharacterName = "Erin"
		d.Text = "Good morning, nobody!"
		add_child(d)
		global.woke_up = 1
