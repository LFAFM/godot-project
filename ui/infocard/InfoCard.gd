extends Node


func toggle(show):
	print("card interacted")
	if(show):
		self.visible = true
	else:
		self.visible = false
