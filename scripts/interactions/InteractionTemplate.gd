extends Node

# Declare member variable here. Examples:
# var a = 2
# var b = "text"
onready var destination = get_node("Position2D").get_global_position()

func interact():
	print("i am interacting")
	get_node("Sprite").get_node("AnimationPlayer").play("interact")
