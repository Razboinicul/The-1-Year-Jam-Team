extends CharacterBody3D
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
	var col=$Camera3D/RayCast3D.get_collider()
	if col != null and col.name == "Bed": 
		$UI/BedLabel.show()
		if Input.is_action_pressed("Interact"):
			goto("res://Scenes/TestScene.tscn")
	else: $UI/BedLabel.hide()
	if col != null and col.name == "Phone": 
		$UI/PhoneLabel.show()
		if Input.is_action_pressed("Interact"):
			goto("res://Scenes/TestScene.tscn")
	else: $UI/PhoneLabel.hide()
	if col != null and col.name == "Laptop": 
		$UI/LaptopLabel.show()
		if Input.is_action_pressed("Interact"):
			goto("res://OS.tscn")
	else: $UI/LaptopLabel.hide()

func goto(scene: String):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene_to_file(scene)
