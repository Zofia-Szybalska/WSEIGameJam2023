extends Camera2D

@export var zoom_scale = 1.0
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	zoom = zoom_scale * Vector2(1/player.transform.get_scale().x,1/player.transform.get_scale().y)
	#offset = player.
