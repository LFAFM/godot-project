extends Area2D

onready var weat_floor_1 = get_node("weat_1_floor_sound")
onready var weat_floor_2 = get_node("weat_2_floor_sound")
#onready var weat_floor_3 = get_node("game_complete")
#onready var weat_floor_4 = get_node("game_complete")


func _ready():
	connect("area_entered", self, "_on_Hitbox_area_entered")

func _on_Hitbox_area_entered(area: Area2D) -> void:
		weat_floor_1.play()
