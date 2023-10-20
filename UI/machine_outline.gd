extends AnimatedSprite2D

@export var scale_v = 1.0
@export var lvl = int(0)
#var scale_v = 0.18
var scale0 = scale
# Called when the node enters the scene tree for the first time.
func _ready():
	frame = lvl


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	scale = Vector2(get_viewport_rect().size.x/1024/2, get_viewport_rect().size.y/768/2) *scale_v
	position = _get_viewport_center() + Vector2(0,scale.y*10)

func _get_viewport_center() -> Vector2:
	var transform : Transform2D = get_viewport_transform()
	var scale : Vector2 = transform.get_scale()
	return -transform.origin / scale + get_viewport_rect().size / scale / 2
