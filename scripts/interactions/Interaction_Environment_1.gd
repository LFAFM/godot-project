extends Node2D

onready var destination = get_node("Position2D").get_global_position()
onready var player_state = get_node("../../Player")
export var player_interaction_animation : String
var interaction_type = "pickUp"
onready var texture = get_node("Sprite").get_texture()
export var RIGHT : bool
var Inventory
var slowmo_active: bool = false
var click_null = 0
var click_true = 1
var anim_finished = false;

export(float) var normal_time_scale: float = 1.0
export(float) var slowmo_time_scale: float = 0.5


func interact():
	set_z_index(5)
	var anim = get_node("Sprite/AnimationPlayer");
	
	if !anim_finished:
		anim.play("portrait_reveal");
		player_state.set_modulate(Color.yellow);
	else:
		anim.play("portrait_fixed");
	
	anim.connect("animation_finished", self, "_animFinished");


func _animFinished(animid : String):
	anim_finished = !anim_finished;
