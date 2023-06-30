extends Node
class_name Interactable

@export var interaction_text : String

func interact(player):
	player.label.text = "Hell no!"
