extends Node2D

var score = 0

func _ready():
	# Find all coins in the scene
	for coin in get_tree().get_nodes_in_group("Coins"):
		coin.connect("collected", Callable(self, "_on_coin_collected"))

func _on_coin_collected():
	score += 1
	print("Score: ", score)
