extends Control

const MEMORY_TILE = preload("res://Scenes/MemoryTile/MemoryTile.tscn")

@onready var tile_grid: GridContainer = $HB/TileGrid
@onready var sound: AudioStreamPlayer = $Sound
@onready var scorer: Scorer = $Scorer
@onready var moves_label: Label = $HB/MarginContainer/VB/HB/MovesLabel
@onready var pairs_label: Label = $HB/MarginContainer/VB/HB2/PairsLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _enter_tree() -> void:
	SignalHub.on_level_button_pressed.connect(level_button_pressed)


func _process(_delta: float) -> void:
	moves_label.text = scorer.get_moves_made_str()
	pairs_label.text = scorer.get_pairs_made_str()


func add_memory_tile(image: Texture2D, frame: Texture2D) -> void:
	var mt: MemoryTile = MEMORY_TILE.instantiate()
	tile_grid.add_child(mt)
	mt.setup(image, frame)


func level_button_pressed(level_num: int):
	var lds: LevelDataSelector = LevelDataSelector.get_level_selection(level_num)
	
	var fi: Texture2D = ImageManager.get_random_frame_image()
	
	tile_grid.columns = lds.get_num_cols()
	
	for im in lds.get_selected_images():
		add_memory_tile(im, fi)
	scorer.clear_new_game(lds.get_target_pairs())

func _on_exit_button_pressed() -> void:
	for t in tile_grid.get_children():
		t.queue_free()
	SoundManager.play_button_click(sound)
	SignalHub.emit_on_exit_button_pressed()
