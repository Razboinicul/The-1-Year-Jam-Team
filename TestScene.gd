extends Control

var dialouge_preload = preload("res://Dialogue.tscn")
var run = 0
func _next_dialouge(): print('dialouge done!!')
func _ready():
	pass

func _process(delta):
	if run == 0:
		var d = dialouge_preload.instance()
		d.rect_global_position = Vector2(0, 400)
		d.CharacterName = "Erin"
		d.Text = "I can talk?!"
		d.connect("next_pressed", self, "_next_dialouge") 
		add_child(d)
		run = 1
