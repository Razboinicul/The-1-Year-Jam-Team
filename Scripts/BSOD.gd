extends Control
@export var reason: String

func _ready(): $Label3.text = "Reason: "+reason
func _on_Button_pressed(): get_tree().change_scene_to_file("res://Scenes/OS.tscn")
