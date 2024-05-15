extends Node

# Node Group for Player
const GROUP_PLAYER: String = "player"

# Speed of the pipes scrolling
const SCROLL_SPEED: float = 120.0

# Preload the main and game scenes into the build 
var main_scene: PackedScene = preload("res://scenes/main/main.tscn")
var game_scene: PackedScene = preload("res://scenes/game/game.tscn")

# Function to load the game scene
func load_game_scene() -> void:
	get_tree().change_scene_to_packed(game_scene)

# Function to load the main scene
func load_main_scene() -> void:
	get_tree().change_scene_to_packed(main_scene)
