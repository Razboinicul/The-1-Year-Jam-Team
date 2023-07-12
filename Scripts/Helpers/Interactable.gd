extends StaticBody3D
class_name Interactable

signal interacted(player)

@export var interaction_text : String

func interact(player):
	emit_signal("interacted", player)
