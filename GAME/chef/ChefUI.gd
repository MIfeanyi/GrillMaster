extends HBoxContainer

signal cook_food
var wait_time = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	for node in get_tree().get_nodes_in_group("game"):
		connect("cook_food",node,"_cook_food")
		pass
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Beer_pressed():
	emit_signal("cook_food","beer")
	pass # Replace with function body.


func _on_Chicken_pressed():
	emit_signal("cook_food","chicken")
	pass # Replace with function body.


func _on_Fish_pressed():
	emit_signal("cook_food","fish")
	pass # Replace with function body.


func _on_Riceball_pressed():
	emit_signal("cook_food","riceball")
	pass # Replace with function body.
