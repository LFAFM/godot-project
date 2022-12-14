extends Node2D


onready var nav2D : Navigation2D = $Navigation2D	
onready var line2D : Line2D = $Line2D
onready var Player : AnimatedSprite = $Player


# Called when the node enters the scene tree for the first time.
func _input(event):
	if !Input.is_action_pressed("ui_leftMouseClick"):
		return


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
