extends Node

func interact():
	print("i am interacting")
	get_node("Sprite").get_node("AnimationPlayer").play("portrait_reveal")
