extends StaticBody2D


func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		if body.dashing:
			set_collision_layer_value(8, false)
			body.get_node(str(body.get_path()) + "/DashTimer").stop()

func _on_area_2d_body_exited(body):
	if body is CharacterBody2D:
		if body.dashing:
			body.dashing = false
