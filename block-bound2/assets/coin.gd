extends Area2D

# Signal emitted when this coin is collected
signal collected

func _ready():
	# Connect the built-in collision signal
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	# Check if the body is the player
	if body.is_class("CharacterBody2D"):
		emit_signal("collected")  # Tell GameManager
		queue_free()  # Remove the coin from the scene
