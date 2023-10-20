extends Area2D

@export var bg:AudioStreamPlayer
@export var player:CharacterBody2D

var timer = 8


func _on_body_entered(body):
	if body is CharacterBody2D:
		bg.stop()
		$Pickup.play()
		$Timer.start()
		player.speed = 0
		player.dash_speed = 0
		

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/Level2.tscn")
