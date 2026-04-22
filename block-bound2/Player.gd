extends CharacterBody2D

@export var speed = 200
var jump_velocity = -400
var gravity = 900

var start_position
var flash_timer = 0.0
var flash_duration = 0.2
var is_flashing = false
var can_move = true  # stop movement when disabled

func _ready():
	start_position = global_position

func _physics_process(delta):
	# Check for restart input (R key)
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene_to_file("res://level_1.tscn")

	if !can_move:
		velocity = Vector2.ZERO
		move_and_slide()
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

	# Check if player fell below the level
	if global_position.y > 1200:
		var gm = get_node("../GameManager")
		if gm:
			gm.lose_life()
		respawn()
		start_flash()

	# Move the player
	move_and_slide()

	# Handle flashing
	if is_flashing:
		flash_timer -= delta
		if flash_timer <= 0:
			$PlayerSprite.modulate = Color(1,1,1)
			is_flashing = false

func respawn():
	global_position = start_position
	velocity = Vector2.ZERO

func start_flash():
	$PlayerSprite.modulate = Color(1,0,0)
	flash_timer = flash_duration
	is_flashing = true

# Disable movement when game over or level complete
func disable_player():
	can_move = false
	velocity = Vector2.ZERO
