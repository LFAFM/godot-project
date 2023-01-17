extends Node2D

# Declare member variable here. Examples:
# var a = 2
# var b = "text"
onready var destination = get_node("Position2D").get_global_position()
onready var player_state = get_node("../../Player")
onready var shader_drunk = get_node("../../Player/Camera2D/ShaderDrunk")
export var player_interaction_animation : String
var interaction_type = "pickUp"
onready var texture = get_node("Sprite").get_texture()
export var RIGHT : bool
var Inventory

func _ready():
	shader_drunk.set_visible(false)

func interact():
	set_z_index(5)
	get_node("Sprite/AnimationPlayer").play("interact")
	shader_drunk.set_visible(true)
	player_state.set_modulate(Color.pink) # play_state.("interact")
	yield(get_node("Sprite/AnimationPlayer"),"animation_finished")
	get_parent().queue_free()
