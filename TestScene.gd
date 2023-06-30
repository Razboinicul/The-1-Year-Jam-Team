extends Control

var dialouge_preload = preload("res://Dialogue.tscn")
var ds_preload = preload("res://Damage System.tscn")
var run = 0
func _get_damage(dmg): print("Damage: ", dmg)
func _next_dialouge(): 
	print('dialouge done!!')
	var ds = ds_preload.instance()
	ds.connect("on_damage_calculated", self, "_get_damage") 
	add_child(ds)

func _process(delta):
	if run == 0:
		var d = dialouge_preload.instance()
		d.CharacterName = "Erin"
		d.Text = "I can talk?!"
		d.connect("next_pressed", self, "_next_dialouge") 
		add_child(d)
		run = 1
