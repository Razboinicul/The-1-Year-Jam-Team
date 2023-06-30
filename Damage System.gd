extends Control
signal on_damage_calculated(damage)
export var damage = 0
var div = 1.7
var run = true
var body_list = {}

func _process(delta):
	$"Line Detection".position = $ColorRect.rect_position
	if run:
		if $ColorRect.rect_position.x >= 600: run = false
		elif Input.is_key_pressed(KEY_SPACE): run = false
		else: $ColorRect.rect_position.x += 10
	else:
		for i in body_list.keys():
			var dmg = i.replace(" ", ".")
			div = float(dmg)
		damage = int($ColorRect.rect_position.x/div)
		emit_signal("on_damage_calculated", damage)
		queue_free()

func _on_Line_Detection_body_entered(body): body_list[body.name] = body
func _on_Line_Detection_body_exited(body): body_list.erase(body.name)
