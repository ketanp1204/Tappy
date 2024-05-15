extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 120.0 * delta




func _on_screen_exited():
	queue_free()


func _on_laser_body_exited(body):
	if body.is_in_group("player"):
		print("Point scored")

func _on_pipe_body_entered(body):
	if body.is_in_group("player"):
		print("Plane dead:", body)
		if body.has_method("die"):
			body.die()
