extends CharacterBody2D

@export var speed = 200
var has_key: bool = false
var dashing: bool = false
var motion_vector
var can_dash: bool = true

func _ready():
	var key = get_tree().get_nodes_in_group("key")
	if key.size() > 0:
		key[0].key_obtained.connect(_on_key_obtained)
	else:
		print("No key in the scene")

func _physics_process(delta):
	if Input.is_action_just_pressed("dash") and not dashing and can_dash:
		dash()
	if not dashing:
		motion_vector = Input.get_vector("left", "right", "up", "down")  * speed
	if motion_vector.x < 0:
		$AnimatedSprite2D.flip_v = true
	else:
		$AnimatedSprite2D.flip_v = false
	move_and_collide(motion_vector * delta)

func dash():
	dashing = true
	make_invincible()
	motion_vector = Input.get_vector("left", "right", "up", "down")  * speed * 5
	print("Dash")
	$DashTimer.start()
	can_dash = false
	$DashCooldownTimer.start()

func make_invincible():
	set_collision_mask_value(3, false)

func _on_key_obtained():
	has_key = true

func _on_dash_cooldown_timer_timeout():
	can_dash = true

func _on_dash_timer_timeout():
	dashing = false
	set_collision_mask_value(3, true)
