extends Node

var woke_up = 0
var hours = 0
func timeout():
	hours += 1
	var t = Timer.new()
	t.wait_time = 1
	t.connect("timeout",self,'timeout')
	add_child(t)

func _ready():
	var t = Timer.new()
	t.wait_time = 1
	t.connect("timeout",self,'timeout')
	add_child(t)

func _process(delta): if hours >= 10: get_tree().change_scene("res://Player.tscn")
