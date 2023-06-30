extends CharacterBody3D

@onready var label = $UI/Label
@export var SPEED = 3
var mouse_sens = 0.3
var camera_anglev=0

func _input(event):
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
	
	var interactable = $Camera3D/RayCast3D.get_collider()
	if interactable is Interactable:
		label.text = interactable.interaction_text
		label.show()
		if Input.is_action_pressed("Interact"):
			interactable.interact(self)
		

func goto(scene: String):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene_to_file(scene)
