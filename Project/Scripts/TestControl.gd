extends Node

func _ready():
	# Initialize Player Inventory
	var inventory = $Inventories/Business/Inventory
	inventory.add_item_return_rest(1,7)
	



