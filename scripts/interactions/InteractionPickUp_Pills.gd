extends Node2D

# Declare member variable here. Examples:
# var a = 2
# var b = "text"
onready var destination = get_node("Position2D").get_global_position()
onready var player_state = get_node("../../Player")
onready var shader_drunk = get_node("../../Player/Node2D/ShaderDrunk")
export var player_interaction_animation : String
var interaction_type = "pickUp"
onready var texture = get_node("Sprite").get_texture()
export var RIGHT : bool
var Inventory
onready var item_audio_player = $"../item_drugs_sound"
onready var background_sound = get_node("../../background_sound")
onready var background_drug_sound = get_node("../../background_drug_sound")

func _ready():
	shader_drunk.set_visible(false)

func interact():
	background_sound.stop()
	item_audio_player.play()
	background_drug_sound.play()
	Engine.time_scale = 0.5
	set_z_index(5)
	get_node("Sprite/AnimationPlayer").play("interact")
	shader_drunk.set_visible(true)
#	player_state.set_modulate(Color.pink) # play_state.("interact")
	
func delete():
	get_parent().queue_free()
	
#	func _input(event):	
#	if event.is_action_pressed("slow_mo"):
#		Engine.time_scale = 0.1
