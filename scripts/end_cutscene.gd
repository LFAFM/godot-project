extends Sprite

onready var cutscene_audio = $"cutscene_audio"

func _ready():
	cutscene_audio.play()
	get_node("AnimationPlayer").play("end_cutscene")
	yield(get_node("AnimationPlayer"),"animation_finished")
	get_tree().change_scene("res://Menu.tscn")
