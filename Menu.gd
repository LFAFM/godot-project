extends Node2D

export var mainGameScene : PackedScene

func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/MarginContainer.grab_focus()

func _on_NewGame_Button_button_up():
	get_tree().change_scene(mainGameScene.resource_path)

func _on_Options_Button_pressed():
	var options = load("res://Menu/Options.tscn").instance() # Replace with function body.
	get_tree().current_scene.add_child(options)
	
func _on_Quit_Button_pressed():
	get_tree().quit() # Replace with function body.
