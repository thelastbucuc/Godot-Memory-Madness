extends Node

signal on_level_button_pressed(level_num: int)
signal on_exit_button_pressed
signal on_tile_selected(tile: MemoryTile)
signal on_game_over(moves_taken: int)


func emit_on_game_over(moves_taken: int) -> void:
	on_game_over.emit(moves_taken)

func emit_on_level_button_pressed(level_num: int) -> void:
	on_level_button_pressed.emit(level_num)

func emit_on_exit_button_pressed() -> void:
	on_exit_button_pressed.emit()

func emit_on_tile_selected(tile: MemoryTile) -> void:
	on_tile_selected.emit(tile)
