extends MeshInstance3D

@onready var interactable = $Interactable

func _on_interactable_interacted(player):
	player.open_dialog("Phone", "Ghost Busters!")

