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
var interactable : Interactable

func _ready():
	state_manager.init_state(self)

func _input(event):
	state_manager.input(event)

func _process(delta):
	state_manager.process(delta)
	if interactable: 
		show_interaction()
	else:
		hide_interaction()

func open_dialog(dialog_key):	
	dialog.load_dialog(dialog_key)
#
func close_dialog():
	state_manager.change_state(PlayerState.States.Idle)
	
func hide_interaction():
	label.text = ""
	label.hide()
	
func show_interaction():
	label.text = interactable.interaction_text
	label.show()
