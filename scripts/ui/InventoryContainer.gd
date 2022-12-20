extends TextureRect

onready var scrollContainer : ScrollContainer = $ScrollContainer
func _on_LeftArrowButton_pressed():
	var value = scrollContainer.get_h_scrollbar()
	scrollContainer.set_h_scroll(value - 100)
	
func _on_RightArrowButton_pressed():
	var value = scrollContainer.get_h_scrollbar()
	scrollContainer.set_h_scroll(value + 100)

func _on_InventoryButton_pressed():
	self.visible = !self.visible
