extends Button
#
#var item : TextureRect = null;
#
#var default_texture = preload("res://ui/inventory/inventory_slot.png")
#var active_texture = preload("res://ui/inventory/inventory_slot_active.png")
#
#var default_style : StyleBoxTexture = null
#var active_style : StyleBoxTexture = null
#
#func _ready():
#	if(get_child_count() != 0):
#		item = get_child(0);
#	default_style = StyleBoxTexture.new()
#	active_style = StyleBoxTexture.new()
#	default_style.texture = default_texture
#	active_style.texture = active_texture
#
#func pickFromSlot():
#	item.set_texture(null)
#
#func putIntoSlot(new_texture, wait : bool):
#	item.set_texture(new_texture)
#	if(wait):
#		item.visible = false
#		yield(get_tree().create_timer(0.05),"timeout")
#		item.visible = true
#
#func toggleActivation(activate : bool):
#	if(activate):
#		set("custom_styles/panel", active_style)
#	else:
#		set("custom_styles/panel", default_style)

onready var item_texture = get_node("Item")

func _ready():
	connect("pressed", self, "on_pressed") #coneta

func on_pressed():
	if item_texture.texture == null : return
	var item_name = item_texture.get_texture().load_path.get_file().get_basename()
	print(item_name)
	match item_name : 
		"item_panties" : 
			print("panties")

