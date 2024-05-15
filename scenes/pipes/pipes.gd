extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_plane_died.connect(_on_plane_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Keep the pipes moving from the right to the left
	position.x -= GameManager.SCROLL_SPEED * delta

func _on_plane_died() -> void:
	set_process(false)

# Remove the pipes from memory once they go off screen
func _on_screen_exited():
	queue_free()

# Handle plane and laser collision
func _on_laser_body_exited(body):
	if body.is_in_group(GameManager.GROUP_PLAYER):
		ScoreManager.increment_score()

# Handle plane and pipe collision
func _on_pipe_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLAYER):
		if body.has_method("die"):
			body.die()
