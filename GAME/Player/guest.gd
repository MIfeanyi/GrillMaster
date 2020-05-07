extends Node2D

var current_food =""
var requested_food =""
export var eat_time = 5
export var request_time = 60

# Called when the node enters the scene tree for the first time.

func request_food():
	if requested_food == "":
		var i = $RequestedFood.rand_food()
		match i:
			1:
				$RequestedFood/fish.set_visible(true)
				$RequestedFood/chicken.set_visible(false)
				$RequestedFood/beer.set_visible(false)
				$RequestedFood/riceball.set_visible(false)
				requested_food= "fish"
			2:
				$RequestedFood/beer.set_visible(true)
				$RequestedFood/fish.set_visible(false)
				$RequestedFood/chicken.set_visible(false)
				$RequestedFood/riceball.set_visible(false)
				requested_food= "beer"
			3:
				$RequestedFood/fish.set_visible(false)
				$RequestedFood/chicken.set_visible(true)
				$RequestedFood/beer.set_visible(false)
				$RequestedFood/riceball.set_visible(false)
				requested_food= "chicken"
			4:
				$RequestedFood/riceball.set_visible(true)
				$RequestedFood/fish.set_visible(false)
				$RequestedFood/chicken.set_visible(false)
				$RequestedFood/beer.set_visible(false)
				requested_food= "riceball"
		$RequestedFood.set_current_food(requested_food)
		$RequestedFood.set_visible(true)

func toogle_timer():
	if $Timer.is_stopped():
		$Timer.start(eat_time)

func _ready():
	request_food()
	toogle_timer()

func update_plate():
	if current_food == "":
		$Food/fish.set_visible(false)
		$Food/chicken.set_visible(false)
		$Food/beer.set_visible(false)
		$Food/riceball.set_visible(false)
		request_food()
	elif current_food =="fish":
		$Food/fish.set_visible(true)
		requested_food = ""
		toogle_timer()
	elif current_food=="chicken":
		$Food/chicken.set_visible(true)
		requested_food = ""
		toogle_timer()
	elif current_food =="beer":
		$Food/beer.set_visible(true)
		requested_food = ""
		toogle_timer()
	elif current_food=="riceball":
		$Food/riceball.set_visible(true)
		requested_food = ""
		toogle_timer()
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
