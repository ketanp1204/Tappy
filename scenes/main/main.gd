extends Control

@onready var high_score_label: Label = $MC/HighScore
@onready var options_menu: Control = $OptionsMenu
@onready var content: Control = $MC

# Called when the node enters the scene tree for the first time.
func _ready():
	high_score_label.text = str(ScoreManager.get_high_score())
	SignalManager.close_options.connect(close_options)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("fly"):
		GameManager.load_game_scene()


func open_options():
	options_menu.show()
	content.hide()
	options_menu.on_open()

func close_options():
	options_menu.hide()
	content.show()
