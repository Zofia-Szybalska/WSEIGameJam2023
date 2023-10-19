extends CharacterBody2D

@export var speed = 200
var has_key: bool = false


func _ready():
	var key = get_tree().get_nodes_in_group("key")
	if key.size() > 0:
		key[0].key_obtained.connect(_on_key_obtained)
	else:
		print("No key in the scene")

func _physics_process(delta):
	var motion_vector = Input.get_vector("left", "right", "up", "down") * speed * delta
	if motion_vector.x < 0:
		$AnimatedSprite2D.flip_v = true
	else:
		$AnimatedSprite2D.flip_v = false
	move_and_collide(motion_vector)

func _on_key_obtained():
	has_key = true
