extends TextureButton

var current_item_key = null 
var current_item_amount = 0
var capacity_limit = 20
var picked_up_all_items = false

onready var default_texture = preload("res://Sprites/PNG/buttonSquare_brown_pressed.png")
onready var label = $RichTextLabel
onready var parent = get_parent()


func is_empty():
	return true if current_item_amount <= 0 else false


func all_items_on_hand():
	return true if picked_up_all_items else false


func get_capacity_limit():
	return capacity_limit


func same_item_in_slot(item_key):
	return true if current_item_key == item_key else false


func add_item_return_rest(item_key, amount_to_add):
	current_item_key = item_key
	var rest = 0
	if (current_item_amount + amount_to_add) > capacity_limit:
		current_item_amount = capacity_limit
		rest = (current_item_amount + amount_to_add) - capacity_limit
	else:
		current_item_amount += amount_to_add
	self.texture_normal = items.itemDictionary[item_key].itemIcon
	update_ui()
	return rest


func remove_item(amount_to_remove):
	current_item_amount -= amount_to_remove
	if is_empty():
		current_item_amount = 0
	update_ui()


func clear_slot():
	current_item_key = null
	current_item_amount = 0
	self.texture_normal = default_texture
	update_ui()


func grey_out():
	current_item_amount = 0
	self.modulate = Color(1,1,1,0.5)
	picked_up_all_items = true


func color_in():
	self.modulate = Color(1,1,1,1)
	picked_up_all_items = false
	update_ui()


func update_ui():
	label.text = String(current_item_amount)


func _on_Slot_pressed():
	if (MovingSlot.is_empty() or MovingSlot.same_item_in_slot(current_item_key)) and not is_empty():
		MovingSlot.add_item_to_hand(current_item_key, 1, self)
		remove_item(1)
		if is_empty():
			grey_out()
	elif not MovingSlot.is_empty() and MovingSlot.origin_slot.parent == parent:
		MovingSlot.return_items_to_origin()




