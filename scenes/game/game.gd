extends Node2D

# Get the pipes scene reference for instantiation
@export var pipes_scene: PackedScene


@onready var spawn_upper = $SpawnUpper
@onready var spawn_lower = $SpawnLower
@onready var spawn_timer = $SpawnTimer

@onready var options_menu = $OptionsMenu

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_plane_died.connect(_on_plane_died)
	SignalManager.close_options.connect(close_options)
	spawn_pipes()
	ScoreManager.set_score(0)


func spawn_pipes() -> void:
	# Instantiate a new pipes scene
	var new_pipes = pipes_scene.instantiate()
	
	# Get a random y position between spawn_upper and spawn_lower for the new pipes scene
	var y_pos = randf_range(spawn_upper.position.y, spawn_lower.position.y)
	
	# Set the position of the new pipes scene
	new_pipes.position = Vector2(spawn_lower.position.x, y_pos)
	
	# Add the pipes scene as a child of the root node
	add_child(new_pipes)

func stop_pipes() -> void:
	spawn_timer.stop()


# Keep spawning pipes based on the timer
func _on_spawn_timer_timeout():
	spawn_pipes()

# Stop the pipes movement when the player dies
func _on_plane_died():
	stop_pipes()


func open_options():
	options_menu.show()
	options_menu.on_open()

func close_options():
	options_menu.hide()
