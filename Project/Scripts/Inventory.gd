extends Popup

onready var background = $Background
onready var slot_grid = $SlotContainer/SlotGrid
onready var slot_container = $SlotContainer
export var MARGIN = 10
export var PADDING = 3

func _ready():
	initialize_layout()

func initialize_layout():
	var columns = slot_grid.columns
	var slot_size = slot_grid.get_child(0).rect_size.x
	var slot_count = slot_grid.get_child_count()
	var rows = (slot_count - (slot_count % columns)) / columns + 1 if not slot_count % columns == 0 else slot_count / columns
	
	slot_grid.set("custom_constants/vseparation", PADDING)
	slot_grid.set("custom_constants/hseparation", PADDING)
	slot_container.margin_left = MARGIN
	slot_container.margin_right = MARGIN * -1
	slot_container.margin_top = MARGIN
	slot_container.margin_bottom = MARGIN * -1
	
	print(rows)
	
	slot_grid.rect_size.x = (slot_size * columns) + PADDING * (columns - 1)
	slot_grid.rect_size.y = (slot_size * rows) + PADDING * (rows - 1)
	
	var background_width = MARGIN * 2
	var background_height = MARGIN * 2
	
	self.rect_size = Vector2(background_width, background_height) + slot_grid.rect_size
	background.rect_size = self.rect_size
	slot_container = slot_grid.rect_size
