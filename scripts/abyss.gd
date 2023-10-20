extends Node2D

signal player_entered
var player

func _ready():
	player = get_parent()

func _on_body_entered(_body):
	player.is_over_abyss = false

func _on_body_exited(_body):
	player.is_over_abyss = true
