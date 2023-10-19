extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_body_entered(body):
	if body.has_key:
		$DoorLockedCollision.set_deferred("disabled", true)
		$DoorLeft.rotation_degrees = 120
		$DoorRight.rotation_degrees = -120
