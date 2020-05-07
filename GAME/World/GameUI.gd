extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0

# Called when the node enters the scene tree for the first time.

func add_score():
	score = score + 100
func reduce_score():
	score = score - 200

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	$GridContainer/Score.set_text("Score: " + str(score))