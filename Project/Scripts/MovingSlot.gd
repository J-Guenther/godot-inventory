extends "res://Scripts/Slot.gd"

var mouse_offset = Vector2(5,5)
var origin_slot = null

func _ready():
	self.visible = false

func _process(delta):
	self.rect_position = get_viewport().get_mouse_position() + mouse_offset

func add_item_to_hand(item_key, amount_to_add, slot_reference):
	add_item_return_rest(item_key, amount_to_add)
	self.origin_slot = slot_reference
	self.visible = true

func remove_item(amount_to_remove):
	.remove_item(amount_to_remove)
	print("Removing")
	if is_empty():
		clear_slot()
		origin_slot.color_in()
		if origin_slot.is_empty():
			origin_slot.clear_slot()
		origin_slot = null
		self.visible = false
		


func return_items_to_origin():
	if origin_slot != null:
		if origin_slot.all_items_on_hand():
			origin_slot.color_in()
		var rest = origin_slot.add_item_return_rest(current_item_key, current_item_amount)
		remove_item(current_item_amount - rest)


func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		return_items_to_origin()


