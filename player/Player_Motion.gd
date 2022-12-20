extends AnimatedSprite


var destination = Vector2()
var distance = Vector2()
var velocity = Vector2()
var snapPosition = Vector2()

var path : PoolVector2Array

export var speed = 250

enum{IDLE, MOVE, CLIMB, INTERACT}

var state = IDLE

var margin = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	destination = position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_distance = speed * delta
	
	match state:
		IDLE:
			pass
		MOVE:
			move_along_path(move_distance)
	pass
	
func move_along_path(distance):
	var starting_point : = position
	
	if(starting_point.x < path[0].x):
		self.set_flip_h( false )
	if(starting_point.x > path[0].x):
		self.set_flip_h( true )
	
	for i in range(path.size()):
		var distance_to_next : = starting_point.distance_to(path[0])
		
		if (distance <= distance_to_next):
			position = starting_point.linear_interpolate(path[0], distance / distance_to_next)
			break
			
		path.remove(0)
		
		if(path.size() ==0):
				change_state(IDLE)
	pass
	
#func move_old
#	if(position != destination):
#		distance = Vector2(destination - position)
#		velocity.x = distance.normalized().x * speed
#		velocity.y = distance.normalized().y * 0
#		move_and_slide(velocity)
#		
#		if(distance.x * distance.x < margin):
#			set_position(snapPosition)
#		
#	else:
#		move_and_slide(velocity * 0)
#		
#		
#	if(destination.x > position.x):
#		get_node( "Player_Sprite" ).set_flip_h( false )
#	if(destination.x < position.x):
#		get_node( "Player_Sprite" ).set_flip_h( true )
#			
#	pass
	
func change_state(newState):
	state = newState
	match state:
		IDLE:
			self.play("idle")
		MOVE:
			self.play("move")	

#func _input(event):
#	if Input.is_action_pressed("ui_leftMouseClick"):
#		destination = get_global_mouse_position()
#		snapPosition.x = destination.x
#		snapPosition.y = position.y
