extends Area2D


func _on_body_entered(_body):
	var gem = get_tree().get_nodes_in_group("blue_gem")
	get_tree().get_nodes_in_group("evil_duck")[0].activate()
	gem[0].show()
	var cannons = get_tree().get_nodes_in_group("cannon")
	for cannon in cannons:
		cannon.appear()
	queue_free()
