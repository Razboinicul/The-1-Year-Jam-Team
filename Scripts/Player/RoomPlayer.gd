extends CharacterBody3D

@onready var label = $InteractionDialog/Label
@export var SPEED = 3
@onready var dialog = $Dialogue
var mouse_sens = 0.3
var camera_anglev = 0
var state = 0

enum States {FREE, CHATTING}

func _input(event):
	if state == States.CHATTING:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if state == States.FREE:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		if event is InputEventMouseMotion:
			rotate_y(deg_to_rad(-event.relative.x*mouse_sens))
			var changev=-event.relative.y*mouse_sens
			if camera_anglev+changev>-50 and camera_anglev+changev<50:
				camera_anglev+=changev
				$Camera3D.rotate_x(deg_to_rad(changev))

func _process(delta):
	move()
	detect_interactable()
	
func move():
	var velocity = Vector3.ZERO
	if Input.is_action_pressed("forward"): velocity -= transform.basis.z 
	if Input.is_action_pressed("backward"): velocity += transform.basis.z 
	if Input.is_action_pressed("right"): velocity += transform.basis.x 
	if Input.is_action_pressed("left"): velocity -= transform.basis.x 
	set_velocity(velocity.normalized() * SPEED)
	set_up_direction(Vector3.UP)
	move_and_slide()
	
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
	state = States.CHATTING
	
	dialog.set_character(character)
	dialog.set_text(text)
	dialog.open()
	
func close_dialog():
	state = States.FREE
	
