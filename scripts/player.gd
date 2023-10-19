extends CharacterBody2D

@export var speed = 200

func _physics_process(delta):
	var motion_vector = Input.get_vector("left", "right", "up", "down") * speed * delta
	if(motion_vector.x < 0):
		$AnimatedSprite2D.flip_v = true
	else:
		$AnimatedSprite2D.flip_v = false
	move_and_collide(motion_vector)
