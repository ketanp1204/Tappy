extends CharacterBody2D

# Define a signal for the plane death
signal on_plane_died

# Get animation sprite 
@onready var animated_sprite = $AnimatedSprite2D

# Get animation player
@onready var animation_player = $AnimationPlayer

# Constants for gravity and power applied to the plane 
const GRAVITY: float = 1500.0
const POWER: float = -500.0  

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Modify the plane velocity
	fly(delta)
	
	# Update the plane velocity
	move_and_slide()
	
	# Die if the plane falls below off the screen
	if is_on_floor():
		die()

func fly(delta: float) -> void:
	# Add gravity 
	velocity.y += GRAVITY * delta
	
	# Push the plane up on pressing the fly action and play the animation
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER
		animation_player.play("power")

func die() -> void:
		# Stop the plane movement and animations
		set_physics_process(false)
		animated_sprite.stop()
		# Emit the die signal 
		on_plane_died.emit() 
