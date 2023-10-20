extends StaticBody2D

enum directions {UP,DOWN,LEFT,RIGHT}

@export var direction: directions
@export var bullet_speed = 100
var direction_vec: Vector2 = Vector2(0,1)
@onready var bullet = preload("res://Objects/bullet.tscn")
var bullet_pos = Vector2(-360,0)


func appear():
	show()
	$ShotTimer.start()
	$CollisionShape2D.set_deferred("disabled", false)

func _ready():
	match direction:
		directions.DOWN:
			direction_vec = Vector2(0,1)
		directions.UP:
			direction_vec = Vector2(0,-1)
			rotation_degrees = 180
		directions.RIGHT:
			direction_vec = Vector2(1,0)
			rotation_degrees = -90
		directions.LEFT:
			direction_vec = Vector2(-1,0)
			rotation_degrees = 90

func _on_shot_timer_timeout():
	var bullet_instance = bullet.instantiate()
	bullet_instance.linear_velocity = direction_vec * bullet_speed
	bullet_instance.position = $Marker2D.position
	$Shot.play()
	add_child(bullet_instance)
