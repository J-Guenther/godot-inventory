extends TextureButton
signal add_to_inventory

var current_item_key = null 
var current_item_amount = 0
var capacity_limit = 20
var picked_up_all_items = false

onready var label = $RichTextLabel
onready var audio_stream = $AudioStreamPlayer
var parent_inventory = null
var merchant = false
var usable = false


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
		rest = (current_item_amount + amount_to_add) - capacity_limit
		current_item_amount = capacity_limit
	else:
		current_item_amount += amount_to_add
	$ItemTexture.texture = items.itemDictionary[item_key].itemIcon
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
	$ItemTexture.texture = null
	update_ui()


func grey_out():
	current_item_amount = 0
	self.modulate = Color(1,1,1,0.5)
	picked_up_all_items = true


func color_in():
	self.modulate = Color(1,1,1,1)
	picked_up_all_items = false


func update_ui():
	if is_empty() and not merchant:
		label.bbcode_text = "[right]" + "" + "[/right]"
	else:
		label.bbcode_text = "[right]" + String(current_item_amount) + "[/right]"
		
	if is_empty():
		if not Hand.is_empty():
			grey_out()
		hint_tooltip = ""
	else:
		color_in()
		hint_tooltip = ("" + items.itemDictionary[current_item_key].name + "\n"
				+ items.itemDictionary[current_item_key].description + "\nBuy: " 
				+ str(items.itemDictionary[current_item_key].buyValue) + "\nSell: "
				+ str(items.itemDictionary[current_item_key].sellValue))


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
			audio_stream.stream = Audio.inventory_click
			audio_stream.play()
			print("Take")
		
		
	# Drop items back by clicking
	elif not Hand.is_empty() and is_same_parent(Hand.origin):
		Hand.return_items_to_origin()
		audio_stream.stream = Audio.inventory_drop
		audio_stream.play()
	# Move items to different inventory by clicking
	elif not Hand.is_empty() and not is_same_parent(Hand.origin):
		var rest = parent_inventory.add_item_return_rest(Hand.current_item_key, Hand.current_item_amount)
		if Hand.origin.merchant:
			if rest == 0:
				Global.Player.value_on_hand = 0
		elif merchant:
			print("Sell")
			Global.Player.update_money(items.itemDictionary[Hand.current_item_key].sellValue * Hand.current_item_amount)
			# TODO what about merchant slot capacity limit?
		else:
			audio_stream.stream = Audio.inventory_pickup
			audio_stream.play()
		Hand.remove_item(Hand.current_item_amount - rest)


func _input(event):
	if Input.is_action_pressed("ui_cancel") and usable and get_global_rect().has_point(get_global_mouse_position()) and Hand.is_empty():
		if not items.itemDictionary[current_item_key].use == null:
			items.itemDictionary[current_item_key].use.call_func()
			remove_item(1)
			if is_empty():
				clear_slot()