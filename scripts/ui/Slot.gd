extends Button

onready var menu_click_select = $"../../../../menu_click_select"

onready var item_texture = get_node("Item")

func _ready():
	connect("pressed", self, "on_pressed") #coneta

func on_pressed():
	print(name)
	menu_click_select.play()
	if item_texture.texture == null : return
	var item_name = item_texture.get_texture().resource_path.get_file().get_basename()
	print(item_name)
	match item_name : 
		"item_panties" : 
			print("panties")

func get_item_name() -> String:
	var item_name = item_texture.get_texture()
	if(item_name != null):
		return item_name.resource_path.get_file().get_basename()
	return""
