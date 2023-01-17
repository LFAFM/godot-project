extends Area2D

onready var nav2D : Navigation2D = get_node("../Navigation2D")
onready var Player : AnimatedSprite = get_node("../Player")

func _ready():
	connect("input_event", self,"_on_InteractionsObjects_input_event")

func _on_InteractionsObjects_input_event(_object, _event, shape_idx):
	if !Input.is_action_pressed("ui_leftMouseClick"):
		return
	get_tree().set_input_as_handled()
		
	Player.is_going_to_interact = true
	Player.interactable_object = self.get_child(shape_idx)
	
	var new_path = nav2D.get_simple_path(Player.get_global_position(), self.get_child(shape_idx).destination)
	Player.path = new_path
