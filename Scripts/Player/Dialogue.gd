extends Control

@onready var dialogs_json_path : String = "res://Assets/dialogs.json"
var dialogs : Dictionary 
var dialog_steps : Array
var dialog : Dictionary
var dialog_step : int = 0

func _ready():
	if FileAccess.file_exists(dialogs_json_path):
		var json_data = FileAccess.open(dialogs_json_path, FileAccess.READ)
		dialogs = JSON.parse_string(json_data.get_as_text())
	else:
		print("Dialogs are missing :(")
		
func load_dialog(dialog_key):
	dialog_steps = dialogs[dialog_key]
	dialog = dialog_steps[dialog_step]
	update_dialog()
	
func update_dialog():
	$CharacterName.text = dialog["who"]
	$Text.text = dialog["text"]
	
	if dialog.has("confirm"):
		$ConfirmButton.text = dialog["confirm"]
		$ConfirmButton.show()
	else:
		$ConfirmButton.hide()
	
	if dialog.has("cancel"):
		$CancelButton.text = dialog["cancel"]
		$CancelButton.show()
	else:
		$CancelButton.hide()
	
	open()

func open():
	show()
	
func close():
	dialog_step = 0
	get_owner().close_dialog()
	hide()

func _on_confirm_button_pressed():
	dialog_step += 1
	if dialog_steps.size() <= dialog_step:
		return close()
	dialog = dialog_steps[dialog_step]
	update_dialog()

func _on_cancel_button_pressed():
	close()
