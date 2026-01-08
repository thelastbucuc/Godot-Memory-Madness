extends Control

@onready var moves_label: Label = $NPR/VB/MovesLabel
@onready var sound: AudioStreamPlayer = $Sound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_game_over.connect(on_game_over)
	SignalHub.on_exit_button_pressed.connect(on_exit_button_pressed)

func on_game_over(moves_made: int) -> void:
	moves_label.text = "You took %d moves" % moves_made
	SoundManager.play_sound(sound, SoundManager.SOUND_GAME_OVER)
	show()


func on_exit_button_pressed() -> void:
	hide()
