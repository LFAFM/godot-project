extends Node2D

onready var destination = get_node("Position2D").get_global_position()
onready var player_state = get_node("../../Player")
onready var shader_drunk = get_node("../../Player/Camera2D/ShaderVeryDrunk")
export var player_interaction_animation : String
var interaction_type = "pickUp"
onready var texture = get_node("Sprite").get_texture()
export var RIGHT : bool
var Inventory
var click_count = 0
var click_limit = 5
var increment_amount = 0.1
var increment_limit = 0.3
onready var item_audio_player = $"../item_beer_sound"


func _ready():
	shader_drunk.set_visible(false)

func interact():
	item_audio_player.play()
	Engine.time_scale -= 0.05
	if increment_amount > increment_limit:
		false
	set_z_index(5)
	get_node("Sprite/AnimationPlayer").play("interact")
	shader_drunk.set_visible(true)
	shader_drunk.get_material().set_shader_param("lod", 0.15 * click_count)
	click_count += 1.0
	if click_count > click_limit:
		get_parent().queue_free()
