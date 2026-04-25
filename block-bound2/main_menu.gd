extends Control

func _ready():
	$AnimationPlayer.play("fade_in")

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://level_1.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _on_instructions_button_pressed():
	$InstructionsPanel.visible = true

func _on_close_button_pressed():
	$InstructionsPanel.visible = false
