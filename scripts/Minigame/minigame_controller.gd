extends Node

class_name MinigameController

@export var dialogue_manager: DialogueView

@export var input : LineEdit

func set_dependencies(dialogue_manager: DialogueView):
	self.dialogue_manager = dialogue_manager

func _ready() -> void:
	input.grab_focus()
