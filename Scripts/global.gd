extends Node

var woke_up = 0
var hours = 0
var dreaming = false
func _timeout():
	
	hours += 1
	var t = Timer.new()
	t.wait_time = 1
	t.connect("timeout", Callable(self, '_timeout'))
	add_child(t)

func _ready():
	var t = Timer.new()
	t.wait_time = 1
	t.connect("timeout", Callable(self, '_timeout'))
	add_child(t)

func _process(delta): if hours >= 10 and not dreaming: 
	dreaming = true
	get_tree().change_scene_to_file("res://Player.tscn")
