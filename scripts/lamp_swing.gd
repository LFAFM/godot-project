extends Node


func _ready():
	var animation_player = get_node("AnimationPlayer")
	var animation = animation_player.get_animation("swing_loop_chandelier")
	animation.loop = true
	animation_player.play("swing_loop_chandelier")
#	var animation_player = get_node("AnimationPlayer")
#	animation_player.play("swing_loop_chandelier")
