extends Node2D

var score = 0
var score_label

func _ready():
	# Get reference to the label
	score_label = get_node("../UI/ScoreLabel")

	# Connect all coins
	for coin in get_tree().get_nodes_in_group("Coins"):
		coin.connect("collected", Callable(self, "_on_coin_collected"))

func _on_coin_collected():
	score += 1
	score_label.text = "Score: " + str(score)
