extends TextureButton
signal add_to_inventory

var current_item_key = null 
var current_item_amount = 0
var capacity_limit = 20
var picked_up_all_items = false

onready var default_texture = preload("res://Sprites/PNG/buttonSquare_brown_pressed.png")
onready var label = $RichTextLabel
var parent_inventory = null
var merchant = false


func is_empty():
	return true if current_item_amount <= 0 else false


func all_items_on_hand():
	return true if picked_up_all_items else false


func contains_same_item(item_key):
	return true if current_item_key == item_key else false


func is_same_parent(other_slot):
	return parent_inventory == other_slot.parent_inventory if other_slot != null else true


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


func update_ui():
	label.bbcode_text = "[right]" + String(current_item_amount) + "[/right]"
	if is_empty():
		grey_out()
	else:
		color_in()


func _on_Slot_pressed():
	# Pick up items by clicking
	if (Hand.is_empty() or Hand.contains_same_item(current_item_key)) and not is_empty() and is_same_parent(Hand.origin):
		var buyValue = items.itemDictionary[current_item_key].buyValue
		if merchant and Global.Player.money >= buyValue:
			Hand.add_item_to_hand(current_item_key, 1, self)
			remove_item(1)
			Global.Player.update_money(-buyValue)
			Global.Player.value_on_hand = buyValue
			print("Buy")
		elif not merchant:
			Hand.add_item_to_hand(current_item_key, 1, self)
			remove_item(1)
			print("Take")
		
		
	# Drop items back by clicking
	elif not Hand.is_empty() and is_same_parent(Hand.origin):
		Hand.return_items_to_origin()
	# Move items to different inventory by clicking
	elif not Hand.is_empty() and not is_same_parent(Hand.origin):
		var rest = parent_inventory.add_item_return_rest(Hand.current_item_key, Hand.current_item_amount)
		if Hand.origin.merchant:
			if rest == 0:
				Global.Player.value_on_hand = 0
		elif merchant:
			Global.Player.update_money(items.itemDictionary[current_item_key].sellValue * Hand.current_item_amount)
			# TODO what about merchant slot capacity limit?
		Hand.remove_item(Hand.current_item_amount - rest)
		
