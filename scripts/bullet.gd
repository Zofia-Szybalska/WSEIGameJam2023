extends RigidBody2D


func _on_body_entered(body):
	if body == get_parent():
		return
	if body is CharacterBody2D:
		body.take_damage()
	queue_free()
