extends Node

func _ready():
	# Initialize Player Inventory
	var inventory = $Inventories/Inventory
	inventory.add_item_return_rest(2,5)
	inventory.add_item_return_rest(1,7)
	
	# Initialize Merchant
	var merchant = $Merchants/Inventory2
	merchant.add_item_return_rest(0,20)


