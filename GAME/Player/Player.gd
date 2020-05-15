extends KinematicBody2D

signal food_action
signal guest_action
signal add_score
signal reduce_score

export (String, "IDLE","PICKUP","DROPPOFF") var STATE
export (String, "PORK", "FISH","BEER") var CURRENT_FOOD
export var SPEED = 9000
export var GRAVITY = 0.3

var direction = Vector2()
export var max_boost = 5.0
var cooldown = false
var current_state
var current_food setget set_current_food, get_current_food
# Called when the node enters the scene tree for the first time.

func set_current_food(value):
	current_food = value

func get_current_food():
	return current_food

func _ready():
	current_food = ""
	for node in get_tree().get_nodes_in_group("game"):
		connect("food_action",node,"_check_food")
		connect("guest_action",node,"_check_guest")
		connect("add_score",node,"_add_score")
		connect("reduce_score",node,"_reduce_score")
	#current_state = STATE[1]
	pass # Replace with function body.

func on_dropoff():
	current_food = ""
	pass

func on_pickup():
	pass

func update_plate():
	if current_food == "":
		$Food/fish.set_visible(false)
		$Food/chicken.set_visible(false)
		$Food/beer.set_visible(false)
		$Food/riceball.set_visible(false)
	elif current_food =="fish":
		$Food/fish.set_visible(true)
	elif current_food=="chicken":
		$Food/chicken.set_visible(true)
	elif current_food =="beer":
		$Food/beer.set_visible(true)
	elif current_food =="riceball":
		$Food/riceball.set_visible(true)
	else:
		pass #pickup food.
	pass
func  input(delta):
	direction = Vector2(0,0)
	if Input.is_action_pressed("ui_right"):
		direction += Vector2(1,0)
	if Input.is_action_pressed("ui_left"):
		direction += Vector2(-1,0)
	if Input.is_action_pressed("ui_up"):
		direction+=Vector2(0,-1)
	if Input.is_action_pressed("ui_down"):
		direction+=Vector2(0,1)
	if Input.is_action_pressed("ui_accept"):
		pass #check for guest / food

	direction = direction * SPEED * delta
	move_and_slide(direction)
	pass



func _physics_process(delta):
	input(delta)
	update_plate()


func _on_Area2D_body_entered(body):
	for group in body.get_groups():
		if group=="food":
			if body.gui_item ==false:
				set_current_food(body.current_food)
				print(body.current_food," food selected.")
				if body.chef_item:
					body.set_current_food("")
		elif group =="guest":
			if body.current_food =="" and body.requested_food == current_food:
				emit_signal("add_score")
				body.current_food = current_food
				set_current_food("")
			else:
				set_current_food("")
				print("you delivered the wrong thing...")
				emit_signal("reduce_score")
		else:
			print(body," is not requested group - ",group)
	pass # Replace with function body.
