extends Button


var open_texture = preload("res://ui/inventory/item_inventory_off.png")
var closed_texture = preload ("res://ui/inventory/item_inventory_on.png")

func _process(delta):
	if(pressed):
		set_button_icon(closed_texture)
	else:
		set_button_icon(open_texture)
