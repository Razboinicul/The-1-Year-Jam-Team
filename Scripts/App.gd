extends Control
@export var window_title: String = "Window Title"

func _process(delta): $Bar/HBoxContainer/Label.text = window_title
func _on_Button_pressed(): get_tree().change_scene_to_file("res://Scenes/OS.tscn")
func _ready(): 
	var i = Interpreter.new()
	i.obj = self
	i.title_bar = $Bar/HBoxContainer/Label
	i.app_control = $Control
	i.run()
