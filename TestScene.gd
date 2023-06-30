extends Control

var dialouge_preload = preload("res://Dialogue.tscn")
var run = 0
func _next_dialouge(): print('dialouge done!!')

func _process(delta):
	if run == 0:
		var d = dialouge_preload.instantiate()
		d.CharacterName = "Erin"
		d.Text = "I can talk?!"
		d.connect("next_pressed", Callable(self, "_next_dialouge")) 
		add_child(d)
		run = 1
