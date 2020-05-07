extends KinematicBody2D

export (String) var current_food = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	if current_food == "":
		$fish.set_visible(false)
		$chicken.set_visible(false)
		$beer.set_visible(false)
	elif current_food =="fish":
		$fish.set_visible(true)
	elif current_food=="chicken":
		$chicken.set_visible(true)
	elif current_food =="beer":
		$beer.set_visible(true)
	elif current_food =="riceball":
		$riceball.set_visible(true)
	else:
		pass #pickup food.
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
