extends Node2D

enum{IDLE, MOVE, CLIMB, INTERACT}


onready var nav2D : Navigation2D = $Navigation2D	
onready var line2D : Line2D = $Line2D
onready var Player : AnimatedSprite = $Player
onready var InteractionObjects : Area2D = $InteractionsObjects

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

## warning-ignore:unused_argument
## warning-ignore:unused_argument
func _on_InteractionsObjects_input_event(object, event, shape_idx):
	if !Input.is_action_pressed("ui_leftMouseClick"):
		return
	if(!object.is_in_group("interactables")): return 
	InteractionObjects = object
	get_tree().set_input_as_handled()
		
	Player.is_going_to_interact = true
	Player.interactable_object = InteractionObjects.get_child(shape_idx)
	
	var new_path = nav2D.get_simple_path(Player.get_global_position(), InteractionObjects.get_child(shape_idx).destination)
	Player.path = new_path
