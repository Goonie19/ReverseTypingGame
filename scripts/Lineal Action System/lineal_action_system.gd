extends Node2D

class_name LinealActionController

@export var waiting_timer: Timer
@export var actions: Array[Action]

var black_screen: BlackScreen
var audio_controller: AudioController
var dialogue_to_inject : DialogueView

func _ready() -> void:
	for i in range(0, actions.size()):
		inject_to_action(actions[i])
	
	play_actions_async()

func play_actions_async() -> void:
	for i in range(0, actions.size()):
		await actions[i].do_action()

func inject_to_action(action: Action) -> void:
	#I don't actually know how to do this using match
	if action is DialogueAction:
		action.set_dependencies(dialogue_to_inject)
	if action is WaitingAction:
		action.set_dependencies(waiting_timer)
	if action is FadeBlackAction:
		action.set_dependencies(black_screen)
	if action is PlayMusicAction or action is PlayTrackAction:
		action.set_dependencies(audio_controller)

func set_dependencies(dialogue_manager: DialogueView, black_screen: BlackScreen, audio_controller: AudioController
		) -> void:
	dialogue_to_inject = dialogue_manager
	self.black_screen = black_screen
	self.audio_controller = audio_controller
