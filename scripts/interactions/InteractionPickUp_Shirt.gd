extends Node2D

onready var destination = get_node("Position2D").get_global_position()
onready var player_state = get_node("../../Player")
export var player_interaction_animation : String
var interaction_type = "pickUp"
onready var texture = get_node("Sprite").get_texture()
export var RIGHT : bool
var Inventory
var slowmo_active: bool = false

export(float) var normal_time_scale: float = 1.0
export(float) var slowmo_time_scale: float = 0.5


func interact():
	set_z_index(5)
	get_node("Sprite/AnimationPlayer").play("interact")
	player_state.set_modulate(Color.wheat) # play_state.("interact")
	yield(get_node("Sprite/AnimationPlayer"),"animation_finished")
	get_parent().queue_free()
