extends Control


@onready var music: AudioStreamPlayer = $Music
@onready var main: Control = $Main
@onready var game: Control = $Game


func _enter_tree() -> void:
	SignalHub.on_level_button_pressed.connect(level_button_pressed)
	SignalHub.on_exit_button_pressed.connect(exit_button_pressed)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exit_button_pressed()


func show_game(s: bool) -> void:
	game.visible = s
	main.visible = !s


func level_button_pressed(level_num: int):
	SoundManager.play_sound(music, SoundManager.SOUND_IN_GAME)
	show_game(true)


func exit_button_pressed():
	SoundManager.play_sound(music, SoundManager.SOUND_MAIN_MENU)
	show_game(false)
