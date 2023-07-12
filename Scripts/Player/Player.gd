extends CharacterBody3D
class_name Player

@onready var label = $InteractionDialog/Label
@onready var interact_ray = $Camera3D/InteractRay
@onready var dialog = $Dialogue
@onready var state_manager = $StateManager
@onready var camera_3d = $Camera3D

var speed = 3
var mouse_sens = 0.3
var camera_anglev = 0

func _ready():
	state_manager.init_state(self)

func _input(event):
	state_manager.input(event)

func _process(delta):
	state_manager.process(delta)
	detect_interactable()
#
func detect_interactable():
	label.text = ""
	label.hide()

	var collider = $Camera3D/InteractRay.get_collider()
	if collider is Interactable:
		label.text = collider.interaction_text
		label.show()
		if Input.is_action_pressed("Interact"):
			collider.interact(self)

func open_dialog(character, text):	
	state_manager.change_state(PlayerState.States.Chatting)
	dialog.set_character(character)
	dialog.set_text(text)
	dialog.open()
#
func close_dialog():
	state_manager.change_state(PlayerState.States.Idle)
	
