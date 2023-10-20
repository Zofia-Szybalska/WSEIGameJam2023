extends Area2D


func _on_body_entered(_body):
	var gem = get_tree().get_nodes_in_group("green_gem")
	gem[0].show()
	var glitched_walls = get_tree().get_nodes_in_group("glitched_wall")
	for wall in glitched_walls:
		wall.show_glitched()
	queue_free()
