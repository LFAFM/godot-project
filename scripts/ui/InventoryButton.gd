extends Button


var open_texture = preload("res://ui/inventory/item_inventory_off.png")
var closed_texture = preload ("res://ui/inventory/item_inventory_on.png")
onready var menu_open = $"../menu_open"
onready var menu_closed = $"../menu_closed"


func _ready():
	connect("toggled", self, "on_toggled")
	
func on_toggled(button_pressed):
	if(pressed):
		menu_open.play()
		set_button_icon(closed_texture)
	else:
		menu_closed.play()
		set_button_icon(open_texture)
