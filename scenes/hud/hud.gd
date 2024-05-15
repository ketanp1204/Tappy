extends Control

@onready var label = $MC/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_score_updated.connect(_on_score_updated)


func _on_score_updated() -> void:
	label.text = str(ScoreManager.get_score())
