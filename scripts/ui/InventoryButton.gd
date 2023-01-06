extends Button


var open_texture = preload("res://ui/inventory/menu_open.png")
var closed_texture = preload ("res://ui/inventory/menu_closed.png")

func _process(delta):
	if(pressed):
		set_button_icon(open_texture)
	else:
		set_button_icon(closed_texture)
