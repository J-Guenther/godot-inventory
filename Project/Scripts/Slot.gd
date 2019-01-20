extends TextureButton

var current_item = null # Key of item dictionairy
var count = 0
export var limit = 20
onready var base_texture = preload("res://Sprites/PNG/buttonSquare_brown_pressed.png")
onready var label = $RichTextLabel
var grey_out = false

func is_empty():
	if count <= 0:
		return true
	else:
		return false

func get_capacity_limit():
	return limit

func add_item(item_key, amount):
	current_item = item_key
	count += amount
	self.texture_normal = items.itemDictionary[item_key].itemIcon
	update_ui()

func remove_item(amount):
	if amount >= count:
		clear_slot()
	else:
		count -= amount
	update_ui()

func clear_slot():
	current_item = null
	count = 0
	self.texture_normal = base_texture
	update_ui()

func toggle_grey():
	if not grey_out:
		count = 0
		self.modulate = Color(1,1,1,0.5)
		grey_out = true
	else:
		self.modulate = Color(1,1,1,1)
		grey_out = false
	update_ui()

func update_ui():
	label.text = String(count)

func _on_Slot_pressed():
	if (MovingSlot.is_empty() or MovingSlot.current_item == current_item) and not is_empty():
		MovingSlot.add_item(current_item, 1, self)
		count -= 1
		if is_empty():
			toggle_grey()
		update_ui()
		


