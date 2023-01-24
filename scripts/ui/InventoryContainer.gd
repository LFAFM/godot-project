extends TextureRect


onready var scrollContainer : ScrollContainer = $ScrollContainer
const SlotClass = preload("res://scripts/ui/Slot.gd")
var temp_item_texture = null
var current_slot = null
var next_slot = null
var active_slot = null
var place_item : bool = false
var timer = 0.1 
onready var movable_item : Node2D = $movable_item
onready var menu_click_left = $"../menu_click_left"
onready var menu_click_right = $"../menu_click_right"

#func _ready():
#	for h_slot in scrollContainer.get_node("HBoxContainer").get_children():
#		h_slot.connect("gui_input", self, "slot_gui_input", [h_slot])
		
func _process(delta):
	if(place_item):
		timer -= delta
		if(timer <= 0):
			place_item = false
			timer = 0.1

func slot_gui_input(event: InputEvent, slot: SlotClass):
	if(place_item):
		next_slot = slot
		if(next_slot.item.get_texture() == null): #don't overwrite the item
			current_slot.pickFromSlot()
			next_slot.putIntoSlot(temp_item_texture, false)
			temp_item_texture = null
			place_item = false
			active_slot = next_slot
			activateSlots(active_slot)
	if(event is InputEventMouseButton):
		if(event.button_index) == BUTTON_LEFT && event.pressed: #left mouse click pressed
			temp_item_texture = slot.item.get_texture()
			current_slot = slot
			movable_item.visible = true
			movable_item.get_node("Item").set_texture(temp_item_texture)
			movable_item.global_position = current_slot.item.get_global_transform().origin
			current_slot.pickFromSlot()
			print(current_slot)
		if(event.button_index) == BUTTON_LEFT && !event.pressed: #left mouse click release
			movable_item.get_node("Item").set_texture(null)
			movable_item.visible = false
			if(temp_item_texture != null):
				current_slot.putIntoSlot(temp_item_texture, true)
				place_item = true
				active_slot = current_slot
				activateSlots(active_slot)
	get_tree().set_input_as_handled()
				
					
func _input(event):
	if(movable_item.visible):
		movable_item.global_position = get_global_mouse_position() # Vector2(-60, -60)

func activateSlots(var slot):
	for h_slot in scrollContainer.get_node("HBoxContainer").get_children():
		if(h_slot == slot):
			h_slot.toggleActivation(true)
		else:
			h_slot.toggleActivation(false)

func _on_LeftArrowButton_pressed():
	menu_click_left.play()
	var value = scrollContainer.get_h_scroll()
	scrollContainer.set_h_scroll(value - 200)


func _on_RightArrowButton_pressed():
	menu_click_right.play()
	var value = scrollContainer.get_h_scroll()
	scrollContainer.set_h_scroll(value + 200)


func _on_InventoryButton_pressed():
	self.visible = !self.visible
