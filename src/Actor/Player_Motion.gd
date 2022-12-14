extends KinematicBody2D


var destination = Vector2()
var distance = Vector2()
var velocity = Vector2()
var snapPosition = Vector2()

export var speed = 250

var margin = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	destination = position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(position != destination):
		distance = Vector2(destination - position)
		velocity.x = distance.normalized().x * speed
		velocity.y = distance.normalized().y * 0
		move_and_slide(velocity)
		
		if(distance.x * distance.x < margin):
			set_position(snapPosition)
		
	else:
		move_and_slide(velocity * 0)
		
		
	if(destination.x > position.x):
		get_node( "Player_Sprite" ).set_flip_h( false )
	if(destination.x < position.x):
		get_node( "Player_Sprite" ).set_flip_h( true )
			
	
	pass

func _input(event):
	if Input.is_action_pressed("ui_leftMouseClick"):
		destination = get_global_mouse_position()
		snapPosition.x = destination.x
		snapPosition.y = position.y
