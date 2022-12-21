extends Node2D

enum{IDLE, MOVE, CLIMB, INTERACT}


onready var nav2D : Navigation2D = $Navigation2D	
onready var line2D : Line2D = $Line2D
onready var Player : AnimatedSprite = $Player
# Called when the node enters the scene tree for the first time.
func _input(event):
	if !Input.is_action_pressed("ui_leftMouseClick"):
		return

	var new_path = nav2D.get_simple_path(Player.get_global_position(), get_global_mouse_position())
	#var new_path = Navigation2DServer.map_get_path(Player.get_global_position(), get_global_mouse_position())

	line2D.points = new_path
	
	Player.path = new_path
	Player.change_state(MOVE)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

