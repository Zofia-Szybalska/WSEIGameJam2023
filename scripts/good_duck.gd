extends Node2D


func _ready():
	$Sprite2D.play("default")

func disapear():
	hide()

