extends Area2D

signal key_obtained
#@export var player:CharacterBody2D

func _on_body_entered(body):
	if body is CharacterBody2D:
		if not body.has_key:
			$Key.play()
			emit_signal("key_obtained")
			hide()
			
		#queue_free()

