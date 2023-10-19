extends Node2D

signal player_entered

func _on_body_entered(body):
	if body is CharacterBody2D:
		if body.dashing:
			body.is_over_abyss = true
			return
		else:
			body.take_damage()
	var vector = Vector2(0,0)
	if body.position.x > position.x:
		vector.x = 1 
	if body.position.x <= position.x:
		vector.x = -1
	if body.position.y > position.y:
		vector.y = 1
	if body.position.y <= position.y:
		vector.y = -1
	body.velocity *= vector #well, nie dziala
	body.move_and_slide()


func _on_body_exited(body):
	if body is CharacterBody2D:
		body.is_over_abyss = false
