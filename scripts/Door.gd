extends Area2D

onready var game_complete = get_node("game_complete")
onready var door_locked = get_node("door_locked")
onready var Inventory = get_node("../UI/Inventory")

func _ready():
	connect("area_entered", self, "_on_Hitbox_area_entered")

func _on_Hitbox_area_entered(area: Area2D) -> void:
	if(Inventory.has_key()):
		game_complete.play()
		yield(game_complete, "finished")
		get_tree().change_scene("res://scenes/Level_2.tscn")
	else:
		door_locked.play()
