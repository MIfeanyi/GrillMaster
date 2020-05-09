extends KinematicBody2D

export (String) var current_food = ""
export (bool) var request_box = false
export (bool) var gui_item = false
export (bool) var chef_item = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if request_box ==true:
		$request_box.set_visible(true)
	if current_food == "":
		$fish.set_visible(false)
		$chicken.set_visible(false)
		$beer.set_visible(false)
		$riceball.set_visible(false)
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

func set_current_food(f):
	current_food = f
	if current_food == "":
		$fish.set_visible(false)
		$chicken.set_visible(false)
		$beer.set_visible(false)
		$riceball.set_visible(false)
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

func rand_food():
	var i = randi()%4+1
	print("Random food[",i,"]")
	return i

