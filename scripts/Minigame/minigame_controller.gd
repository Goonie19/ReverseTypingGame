extends Node

class_name MinigameController

@export var input : LineEdit
@export var text_label : RichTextLabel

@export var text_to_type : String = "Esta es la frase"

@export var waveAmp : float = 50.0
@export var waveFreq : float = 0.5
@export var waveConnected : int = 0

var current_text_index = 0

func _ready() -> void:
	input.grab_focus()

func check_result(new_text: String) -> void:
	if not text_to_type.begins_with(new_text):
		reset_text()
	else:
		update_text(new_text)

func reset_text():
	input.clear()
	current_text_index = 0

func update_text(new_text: String) -> void:
	var colored_text = text_to_type
	colored_text = colored_text.insert(new_text.length(), "[/color]")
	colored_text = "[color=white]" + colored_text
	text_label.text = colored_text
	current_text_index += 1
