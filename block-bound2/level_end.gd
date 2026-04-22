extends Area2D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.is_class("CharacterBody2D"):
		get_tree().change_scene_to_file("res://level_2.tscn")
