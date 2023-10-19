extends StaticBody2D


@export var direction: Vector2 = Vector2(1,0)
@onready var bullet = preload("res://Objects/bullet.tscn")

func _ready():
	position *= direction

func _on_shot_timer_timeout():
	var bullet_instance = bullet.instantiate()
	bullet_instance.linear_velocity = direction * 100
	add_child(bullet_instance)
