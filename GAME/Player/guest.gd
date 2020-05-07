extends Node2D

var current_food =""
export var eat_time = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func update_plate():
	if current_food == "":
		$Food/fish.set_visible(false)
		$Food/chicken.set_visible(false)
		$Food/beer.set_visible(false)
		$Food/riceball.set_visible(false)
	elif current_food =="fish":
		$Food/fish.set_visible(true)
		if $Timer.is_stopped():
			$Timer.start(eat_time)
	elif current_food=="chicken":
		$Food/chicken.set_visible(true)
		if $Timer.is_stopped():
			$Timer.start(eat_time)
	elif current_food =="beer":
		$Food/beer.set_visible(true)
		if $Timer.is_stopped():
			$Timer.start(eat_time)
	elif current_food=="riceball":
		$Food/riceball.set_visible(true)
		if $Timer.is_stopped():
			$Timer.start(eat_time)
	else:
		pass #pickup food.
	pass
func hand_food(f):
	pass

func _physics_process(delta):
	update_plate()
#	pass


func _on_Timer_timeout():
	current_food=""
	pass # Replace with function body.
