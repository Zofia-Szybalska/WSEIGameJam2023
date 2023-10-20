extends Node2D


func activate():
	show()
	$Area2D/CollisionShape2D.set_deferred("disabled", false)
	z_index = 0

func _on_area_2d_body_entered(_body):
	z_index = 100
	var tween = get_tree().create_tween()
	$AudioStreamPlayer.play()
	$Timer.start()
	tween.tween_property($AnimatedSprite2D, "scale", Vector2(6,6), 2)


func _on_timer_timeout():
	get_tree().quit()
