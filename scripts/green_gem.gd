extends Area2D


func _on_body_entered(_body):
	get_parent().find_child("Arcade").frame = 1
	var gem = get_tree().get_nodes_in_group("green_gem")
	get_tree().get_nodes_in_group("good_duck")[0].hide()
	gem[0].show()
	$Pickup.play()
	set_collision_mask_value(1, false)
	hide()
	var glitched_walls = get_tree().get_nodes_in_group("glitched_wall")
	for wall in glitched_walls:
		wall.show_glitched()
	#queue_free()

