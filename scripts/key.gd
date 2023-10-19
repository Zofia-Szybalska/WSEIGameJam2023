extends Area2D

signal key_obtained

func _on_body_entered(body):
	if body is CharacterBody2D:
		emit_signal("key_obtained")
		queue_free()

