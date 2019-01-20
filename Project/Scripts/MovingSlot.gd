extends "res://Scripts/Slot.gd"

export var mouse_offset = Vector2(5,5)
var item_origin = null

func _ready():
	self.visible = false

func _process(delta):
	self.rect_position = get_viewport().get_mouse_position() + mouse_offset

func add_item(item_key, amount, item_origin):
	.add_item(item_key, amount)
	self.item_origin = item_origin
	self.visible = true

func remove_item(amount):
	.remove_item(amount)
	if self.is_empty():
		self.visible = false

func _input(event):
	if Input.is_action_pressed("ui_cancel") and item_origin != null:
		if item_origin.is_empty():
			item_origin.toggle_grey()
		item_origin.add_item(current_item, count)
		remove_item(count)

