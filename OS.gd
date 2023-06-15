extends Control

func _ready():
	pass # Replace with function body.

func _on_Button_pressed(): get_tree().change_scene("res://TestScene3D.tscn")
func _on_ExampleApp_pressed(): get_tree().change_scene("res://App.tscn")
