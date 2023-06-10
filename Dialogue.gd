extends ColorRect

export var CharacterName: String
export var Text: String
signal next_pressed

func _ready():
	$CharacterName.text = CharacterName
	$Text.text = Text

func _on_Button_pressed():
	emit_signal("next_pressed")
	queue_free()
