extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _cook_food(f):
	print("Cooking: ", f)
	for food in get_tree().get_nodes_in_group("food"):
		if food.chef_item == true:
			if food.current_food =="":
				food.set_current_food(f)
				print("empty slot for ",f)
				return
			else:
				print("Currently holding:", food.current_food)
	pass
func _check_food(f):
	print("we will check if the player is picking up a plate/dropping off.")
	pass

func _add_score():
	$World/GameUI.add_score()
func _reduce_score():
	$World/GameUI.reduce_score()

func _check_guest(f,g):
	print(f, " given to ",g)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
