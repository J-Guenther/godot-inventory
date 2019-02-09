extends "res://Scripts/Slot.gd"

var mouse_offset = Vector2(5,5)
var origin = null


func _ready():
	self.visible = false


func _process(delta):
	self.rect_position = get_viewport().get_mouse_position() + mouse_offset


func add_item_to_hand(item_key, amount_to_add, slot_reference):
	add_item_return_rest(item_key, amount_to_add)
	self.origin = slot_reference
	self.visible = true


func remove_item(amount_to_remove):
	.remove_item(amount_to_remove)
	if is_empty():
		clear_slot()
		if origin.is_empty() and not origin.merchant:
			origin.color_in()
			origin.clear_slot()
			print("Clear origin")
		origin = null
		self.visible = false
		


func return_items_to_origin():
	if origin != null:
		var rest = origin.add_item_return_rest(current_item_key, current_item_amount)
		remove_item(current_item_amount - rest)


func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		if not is_empty() and origin.merchant:
			Global.Player.update_money(Global.Player.value_on_hand * current_item_amount)
			Global.Player.value_on_hand = 0
		return_items_to_origin()
		audio_stream.stream = Audio.inventory_drop
		audio_stream.play()
		


