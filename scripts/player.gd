#@tool
extends CharacterBody2D

@export var speed = 100
@export var dash_speed = 400
@export var texture = Resource
@export var sprite_scale = Vector2(1,1)
@export var zoom_scale = 0.7

var spawnpoint: Vector2

var has_key: bool = false
var dashing: bool = false
var motion_vector
var can_dash: bool = true
var is_over_abyss: bool = false
var dash_starting_pos: Vector2
var dash_dir_vel: Vector2
var g_wall_area_c = 0

var speed_tmp = speed
var dash_speed_tmp = dash_speed

#func _process(_delta):
func _ready():
	spawnpoint = position
	$Camera2D.zoom_scale = zoom_scale
	$AnimatedSprite2D.sprite_frames = texture
	$AnimatedSprite2D.scale = sprite_scale
	var key = get_tree().get_nodes_in_group("key")
	if key.size() > 0:
		key[0].key_obtained.connect(_on_key_obtained)
	else:
		print("No key in the scene")

func _physics_process(_delta):
	#print(position)
	
	if not dashing and is_over_abyss:
		#position = dash_starting_pos
		take_damage()
	if Input.is_action_just_pressed("dash") and not dashing and can_dash:
		dash()
	if not dashing:
		motion_vector = move(speed)
	else:
		motion_vector = dash_dir_vel
	if motion_vector.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif motion_vector.x > 0:
		$AnimatedSprite2D.flip_h = false
	velocity = motion_vector
	if velocity == Vector2(0,0):
		$AnimatedSprite2D.play("idle")
	else:
		$AnimatedSprite2D.play("walking")
	move_and_slide()

func dash():
	#dash_starting_pos = position
	$Dash.play()
	dashing = true
	make_invincible()
	dash_dir_vel = move(dash_speed)
	$DashTimer.start()
	can_dash = false
	$DashCooldownTimer.start()

func make_invincible():
	set_collision_mask_value(3, false)
	set_collision_mask_value(5, false)

func _on_key_obtained():
	has_key = true

func _on_dash_cooldown_timer_timeout():
	can_dash = true

func _on_dash_timer_timeout():
	dashing = false
	set_collision_mask_value(3, true)
	set_collision_mask_value(5, true)

func take_damage():
	#speed_tmp = speed
	speed = 0
	#dash_speed_tmp = dash_speed
	dash_speed = 0
	$AnimationPlayer.play("Falling")
	$Death.play()
	

func move(vel):
	return Input.get_vector("left", "right", "up", "down")  * vel


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Falling":
		is_over_abyss = false
		position = spawnpoint
		$AnimationPlayer.play_backwards("Raising")
	else:
		speed = speed_tmp
		dash_speed = dash_speed_tmp
