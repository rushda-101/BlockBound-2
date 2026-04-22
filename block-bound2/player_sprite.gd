extends CharacterBody2D

@export var speed = 200
var jump_velocity = -400
var gravity = 900

var start_position
var flash_timer = 0.0
var flash_duration = 0.2  # seconds
var is_flashing = false

func _ready():
	start_position = global_position

func _physics_process(delta):
	# Horizontal movement
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed

	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jump
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_velocity

	# Check if player fell below the level
	if global_position.y > 1200:
		get_node("../GameManager").lose_life()
		respawn()
		start_flash()

	# Move the player
	move_and_slide()

	# Handle flashing
	if is_flashing:
		flash_timer -= delta
		if flash_timer <= 0:
			$Sprite2D.modulate = Color(1,1,1)  # back to normal
			is_flashing = false

# Respawn function
func respawn():
	global_position = start_position
	velocity = Vector2.ZERO

func start_flash():
	$Sprite2D.modulate = Color(1,0,0)  # red
	flash_timer = flash_duration
	is_flashing = true
