extends Node2D


func activate():
	show()


func _on_area_2d_area_entered(area):
	var tween = get_tree().create_tween()
	tween.tween_property($AnimatedSprite2D, "scale", Color.RED, 1)

