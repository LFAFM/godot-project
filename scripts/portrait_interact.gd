extends Node2D

onready var destination = get_node("../Position2D").get_global_position()
onready var player_state = get_node("../../../Player")
export var player_interaction_animation : String
onready var texture = get_node("Sprite").get_texture()
export var RIGHT : bool

func interact():
	set_z_index(5)
	get_node("Sprite/AnimationPlayer").play("portrait_reveal")
	yield(get_node("Sprite/AnimationPlayer"),"animation_finished")
	get_parent().queue_free()
