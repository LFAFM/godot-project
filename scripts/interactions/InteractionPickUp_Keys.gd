extends Node2D

# Declare member variable here. Examples:
# var a = 2
# var b = "text"
onready var destination = get_node("Position2D").get_global_position()
onready var player_state = get_node("../../Player")
export var player_interaction_animation : String
var interaction_type = "pickUp"
onready var texture = get_node("Sprite").get_texture()
export var RIGHT : bool
onready var Inventory = get_node("../../UI/Inventory")
onready var item_audio_player = $"../item_keys_sound"


func interact():
	item_audio_player.play()
	set_z_index(5)
	get_node("Sprite/AnimationPlayer").play("interact")
	player_state.set_modulate(Color.palevioletred) # play_state.("interact")
	yield(get_node("Sprite/AnimationPlayer"),"animation_finished")
	Inventory.set_item(texture) # ADICIONAR AO INVENTÁRIO
	get_parent().queue_free()


