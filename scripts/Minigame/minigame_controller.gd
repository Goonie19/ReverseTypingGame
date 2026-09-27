extends Node

class_name MinigameController

@export var input : LineEdit
@export var text_label : RichTextLabel
@export var timer : Timer
@export var animator : AnimationPlayer

@export var text_to_type : String = "Esta es la frase"

@export var waveAmp : int = 50
@export var waveFreq : int = 5
@export var waveConnected : int = 0

var wave_tag_init : String = "[wave amp=%d freq=%de connected=%d]" % [waveAmp, waveFreq, waveConnected]
var wave_tag_end : String = "[/wave]"

var current_text_index = 0

var currently_playing : bool = false

func _ready() -> void:
	input.grab_focus()
	text_to_type = text_to_type.reverse()
	text_label.text = text_to_type
	currently_playing = true;

func check_result(new_text: String) -> void:
	if not currently_playing :
		return
	
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
	check_if_completed()

func check_if_completed() -> void:
	if current_text_index >= text_to_type.length():
		text_label.text = wave_tag_init + text_label.text + wave_tag_end
		currently_playing = false
