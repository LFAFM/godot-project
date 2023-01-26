extends AnimatedSprite


var destination = Vector2()
var distance = Vector2()
var velocity = Vector2()
var snapPosition = Vector2()

var is_climbing : bool

var path : PoolVector2Array

export var speed = 250

# ENUMERADO E ESTADOS DO JOGADOR
enum KSTATE{IDLE, MOVE, CLIMB, INTERACT} # IDLE
var has_sweaty_panties : bool = false # 1º OBJ [true = 1; false = 0]
var has_glasses : bool = false  # 2º OBJ [true = 1; false = 0]
var has_pants : bool = false # 3º OBJ [true = 1; false = 0]
var has_shirt : bool = false # 4º OBJ [true = 1; false = 0]
var has_tshirt : bool = false # 5º OBJ [true = 1; false = 0]
var has_shoes : bool = false # 6º OBJ [true = 1; false = 0]

var state = KSTATE.IDLE

var is_going_to_interact : bool
var interactable_object 
var interaction_timer = 1

var margin = 1


# Called when the node enters the scene tree for the first time.
func _ready():
#	has_sweaty_panties = true
#	has_glasses = true
#	has_pants = true
#	has_shirt = true
#	has_tshirt = true
#	has_shoes = true
	change_state(KSTATE.IDLE)
	destination = position
	is_climbing = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_distance = speed * delta 
	
	match state:
		KSTATE.IDLE:
			pass
		KSTATE.MOVE:
			move_along_path(move_distance)
		KSTATE.CLIMB:
			climb_along_path(move_distance)
		KSTATE.INTERACT:
			interact(delta)
	pass
	
func move_along_path(distance):
	var starting_point : = position 
	
	if(is_climbing):
		change_state(KSTATE.CLIMB)
	
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
				change_state(KSTATE.INTERACT)
			else:
				change_state(KSTATE.IDLE)
		pass
	
func climb_along_path(distance):
	var starting_point : = position 
	
	if(starting_point.y > path[0].y):
		self.play("climb")
	if(starting_point.y < path[0].y):
		self.play("climb", true)
		
	if(!is_climbing):
		change_state(KSTATE.MOVE)
	
	for i in range(path.size()):
		var distance_to_next : = starting_point.distance_to(path[0])
		
		if (distance <= distance_to_next):
			position = starting_point.linear_interpolate(path[0], distance / distance_to_next) 
			break
		
		path.remove(0)
		
		if(path.size() == 0):
			change_state(KSTATE.IDLE)			
	pass
	
func interact(delta):
	interaction_timer -= delta
	if(interaction_timer <= 0):
		change_state(KSTATE.IDLE)
		interaction_timer = 1

	
func change_state(newState):
	state = newState
	match state: 
		KSTATE.IDLE:
			if(!is_climbing):
				print(KSTATE.keys()[state].to_lower())
				self.play("%s_%s_%s_%s_%s_%s_%s" % [
					KSTATE.keys()[state].to_lower(),
					int(has_sweaty_panties), int(has_glasses), int(has_pants), int(has_shirt), int(has_tshirt), int(has_shoes)
				]) # falta definir 3 variáveis 
			if(is_climbing):
				self.play("climb_idle")
		KSTATE.MOVE:
				self.play("%s_%s_%s_%s_%s_%s_%s" % [
					KSTATE.keys()[state].to_lower(),
					int(has_sweaty_panties), int(has_glasses), int(has_pants), int(has_shirt), int(has_tshirt), int(has_shoes)
				])
		KSTATE.INTERACT:
			interactable_object.interact()
			self.play("%s_%s_%s_%s_%s_%s_%s" % [
				KSTATE.keys()[state].to_lower(),
				int(has_sweaty_panties), int(has_glasses), int(has_pants), int(has_shirt), int(has_tshirt), int(has_shoes)
			])
