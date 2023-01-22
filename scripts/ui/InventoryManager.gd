extends Node2D

onready var holder = get_node("InventoryContainer/ScrollContainer/HBoxContainer")


func set_item(texture : Texture) -> bool:
	for i in holder.get_child_count():
		var current_item = holder.get_child(i).get_node("Item")
		if(current_item.texture == null):
			current_item.texture = texture
			return true
	return false 
