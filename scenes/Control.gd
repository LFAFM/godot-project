extends Node2D

enum{IDLE, MOVE, CLIMB, INTERACT}


onready var nav2D : Navigation2D = $Navigation2D	
onready var line2D : Line2D = $Line2D
onready var Player : AnimatedSprite = $Player

# expressões para audio
# onready var global_audio_player = $"../../ambientplayer
# onready var sfx_audio_player = $"../../ambientplayer

func _unhandled_input(event):
	if(!(event is InputEventMouseButton) || !event.is_pressed()):
		return
	if (Player.state == INTERACT):
		return
	
	var new_path = nav2D.get_simple_path(Player.get_global_position(), get_global_mouse_position())

	line2D.points = new_path

	Player.path = new_path
	Player.is_going_to_interact = false

	Player.change_state(MOVE)
