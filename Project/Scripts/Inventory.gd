extends Container

# Visuals
onready var background = $Background
onready var slot_grid = $SlotContainer/SlotGrid
onready var slot_container = $SlotContainer
export var MARGIN = 10
export var PADDING = 3

# Content
var slots = Array()

func _ready():
	initialize_layout()
	slots = slot_grid.get_children()
	add_item(0,5)

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

func add_item(item, amount):
	for slot in slots:
		if slot.is_empty():
			slot.add_item(item, amount)
			return