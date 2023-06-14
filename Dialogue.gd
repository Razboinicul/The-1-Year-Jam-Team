extends ColorRect

export var CharacterName: String
export var Text: String
signal next_pressed

func _ready():
	$CharacterName.text = CharacterName
	$Text.text = Text

func _input(event): if event.has_method('is_action_pressed') and event.is_action_pressed("Next"): 
	emit_signal("next_pressed") 
	queue_free()

func _on_Button_pressed():
	emit_signal("next_pressed")
	queue_free()
