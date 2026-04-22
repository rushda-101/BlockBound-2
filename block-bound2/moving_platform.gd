extends Node2D

@export var move_distance = 200
@export var speed = 60

var start_x
var direction = 1

func _ready():
	start_x = position.x

func _process(delta):
	position.x += speed * direction * delta

	if position.x > start_x + move_distance:
		direction = -1
	elif position.x < start_x - move_distance:
		direction = 1
