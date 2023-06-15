extends Node

var woke_up = 0
var hours = 0

func _process(delta): if hours >= 10: get_tree().change_scene("res://Player.tscn")
