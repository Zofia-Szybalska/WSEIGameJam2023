extends StaticBody2D


func show_glitched():
	play_sprites()
	$Area2D/CollisionShape2D.set_deferred("disabled", false)

func play_sprites():
	var sprites = $Sprites.get_children()
	for sprite in sprites:
		sprite.play("default")

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		if body.dashing:
			body.g_wall_area_c += 1
			set_collision_layer_value(8, false)
			body.get_node(str(body.get_path()) + "/DashTimer").stop()

func _on_area_2d_body_exited(body):
	set_collision_layer_value(8, true)
	if body is CharacterBody2D:
		if body.dashing:
			body.g_wall_area_c -= 1
			if body.g_wall_area_c < 1:
				body.dashing = false
