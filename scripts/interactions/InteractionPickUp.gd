extends Node

# Declare member variable here. Examples:
# var a = 2
# var b = "text"
onready var destination = get_node("Position2D").get_global_position()
export var player_interaction_animation : String
var interaction_type = "pickUp"
onready var texture = get_node("Sprite").get_texture()
export var RIGHT : bool
var Inventory


func interact():
	print("i am interacting")
	get_node("Sprite").get_node("AnimationPlayer").play("interact")
