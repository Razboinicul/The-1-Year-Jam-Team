extends Control

func set_character(character_name):
	$CharacterName.text = character_name

func set_text(text):
	$Text.text = text

func open():
	show()
	
func close():
	hide()

func _on_Button_pressed():
	get_owner().close_dialog()
	close()
