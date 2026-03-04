extends CharacterBody2D

# Movement speed
@export var speed = 200
var jump_velocity = -400
var gravity = 900

# Store start position for respawn
var start_position

func _ready():
	start_position = global_position

func _physics_process(delta):

	# Stop movement if game is over
	if get_node("../GameManager").game_over:
		return

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

	# Check if player fell
	if global_position.y > 1200:
		get_node("../GameManager").lose_life()
		respawn()
		
	# Move the player
	move_and_slide()
	
	# Prevent moving off the left edge
	if global_position.x < 0:
		global_position.x = 0

func respawn():
	global_position = start_position
	velocity = Vector2.ZERO
