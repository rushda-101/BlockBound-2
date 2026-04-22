extends Area2D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "Player":
		print("Player reached Level 3 flag")
		
		# Stop the player
		body.disable_player()
		
		# Show the You Won panel
		var panel = get_node("../UI/YouWonPanel")
		if panel:
			panel.visible = true
