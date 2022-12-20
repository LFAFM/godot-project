extends AnimatedSprite


var destination = Vector2()
var distance = Vector2()
var velocity = Vector2()
var snapPosition = Vector2()

var is_climbing : bool

var path : PoolVector2Array

export var speed = 250

enum{IDLE, MOVE, CLIMB, INTERACT}

var state = IDLE

var is_going_to_interact : bool
var interactable_object 
var interaction_timer = 1

var margin = 1



# Called when the node enters the scene tree for the first time.
func _ready():
	destination = position
	is_climbing = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_distance = speed * delta 
	
	match state:
		IDLE:
			pass
		MOVE:
			move_along_path(move_distance)
		CLIMB:
			climb_along_path(move_distance)
		INTERACT:
			interact(delta)
	pass
	
func move_along_path(distance):
	var starting_point : = position 
	
	if(is_climbing):
		change_state(CLIMB)
	
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
		
		if(path.size() == 0):
			if(is_going_to_interact):
				change_state(INTERACT)
			else:
				change_state(IDLE)			
	pass
	
func climb_along_path(distance):
	var starting_point : = position 
	
	if(starting_point.y > path[0].y):
		self.play("climb")
	if(starting_point.y < path[0].y):
		self.play("climb", true)
		
	if(!is_climbing):
		change_state(MOVE)
	
	for i in range(path.size()):
		var distance_to_next : = starting_point.distance_to(path[0])
		
		if (distance <= distance_to_next):
			position = starting_point.linear_interpolate(path[0], distance / distance_to_next) 
			break
		
		path.remove(0)
		
		if(path.size() == 0):
			change_state(IDLE)			
	pass
	
func interact(delta):
	interaction_timer -= delta
	if(interaction_timer <= 0):
		change_state(IDLE)
		interaction_timer = 1

	
func change_state(newState):
	state = newState
	match state: 
		IDLE:
			if(!is_climbing):
				self.play("idle")
			if(is_climbing):
				self.play("climb_idle")
		MOVE:
			self.play("move")
		INTERACT:
			interactable_object.interact()
			self.play("interact")
			print("interact, yeayyy!")
