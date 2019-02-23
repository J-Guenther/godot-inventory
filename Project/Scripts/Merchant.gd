extends TabContainer

onready var resources = $Resources/Inventory
onready var food = $Food/Inventory
onready var crafting = $"Wood & Metal/Inventory"
onready var books = $Books/Inventory
onready var alchemy = $Alchemy/Inventory
onready var dark = $"Dark Arts/Inventory"

func _ready():
	# Fill all Inventories
	resources.add_item_return_rest(0,10)
	resources.add_item_return_rest(1,10)
	resources.add_item_return_rest(2,10)
	resources.add_item_return_rest(3,10)
	resources.add_item_return_rest(4,10)
	resources.add_item_return_rest(5,10)
	resources.add_item_return_rest(6,10)
	resources.add_item_return_rest(7,10)
	resources.add_item_return_rest(8,10)
	resources.add_item_return_rest(9,10)
	resources.add_item_return_rest(10,10)
	
	crafting.add_item_return_rest(11,10)
	crafting.add_item_return_rest(12,10)
	crafting.add_item_return_rest(13,10)
	crafting.add_item_return_rest(14,10)
	crafting.add_item_return_rest(15,10)
	crafting.add_item_return_rest(16,10)
	crafting.add_item_return_rest(17,10)
	crafting.add_item_return_rest(18,10)
	crafting.add_item_return_rest(19,10)
	crafting.add_item_return_rest(20,10)
	crafting.add_item_return_rest(21,10)