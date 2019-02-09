extends Container

# Visuals
onready var background = $Background
onready var slot_grid = $SlotContainer/SlotGrid
onready var slot_container = $SlotContainer
export var MARGIN = 10
export var PADDING = 3
export var merchant = false
export var usable = false
export var capacity = 20
export var header = ""

# Content
var slots = Array()

func _ready():
	initialize_layout()
	slots = slot_grid.get_children()
	for slot in slots:
		slot.parent_inventory = self
		slot.capacity_limit = capacity
		slot.usable = usable
		if merchant:
			slot.merchant = true
	$Header/RichTextLabel.bbcode_text = "[center]" + header + "[/center]"


func initialize_layout():
	var slot_size = slot_grid.get_child(0).rect_size.x
	var slot_count = slot_grid.get_child_count()
	var columns = slot_grid.columns
	var rows = (slot_count - (slot_count % columns)) / columns + 1 if not slot_count % columns == 0 else slot_count / columns
	
	# Calculate Margin between grid and background
	slot_grid.set("custom_constants/vseparation", PADDING)
	slot_grid.set("custom_constants/hseparation", PADDING)
	slot_container.margin_left = MARGIN
	slot_container.margin_right = MARGIN * -1
	slot_container.margin_top = MARGIN
	slot_container.margin_bottom = MARGIN * -1
	
	# Calculate grid width and height
	slot_grid.rect_size.x = (slot_size * columns) + PADDING * (columns - 1)
	slot_grid.rect_size.y = (slot_size * rows) + PADDING * (rows - 1)
	
	# Calculate background width and height
	var background_width = MARGIN * 2
	var background_height = MARGIN * 2
	
	# Set calculated sizes
	self.rect_size = Vector2(background_width, background_height) + slot_grid.rect_size
	background.rect_size = self.rect_size
	slot_container = slot_grid.rect_size

func add_item_return_rest(item, amount):
	var empty_slot = null
	for slot in slots:
		if slot.is_empty() and slot.current_item_key == null and empty_slot == null:
			empty_slot = slot
		elif slot.contains_same_item(item):
			return slot.add_item_return_rest(item, amount)
	if empty_slot != null:
		return empty_slot.add_item_return_rest(item, amount)
	else:
		return null

