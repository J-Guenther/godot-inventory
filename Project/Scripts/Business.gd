extends Container

onready var inventory = $Inventory

export var workers = 0
export var business_name = "Business"
export var business_lvl = 1
var business_profession = "None"
var business_owner = "Nobody"

func _ready():
	update_ui()
	for recipe in $Crafting/ScrollContainer/VBoxContainer.get_children():
		recipe.parent = self
		inventory.connect("inventory_changed", recipe, "_on_inventory_change")
	

func update_ui():
	$MetaInfo/VBoxContainer/WorkersLabel.bbcode_text = "Workers: " + str(workers)
	$MetaInfo/VBoxContainer/StatusLabel.bbcode_text = "Business Level: " + str(business_lvl)
	$MetaInfo/VBoxContainer/Profession.bbcode_text = "Profession: " + business_profession
	$MetaInfo/VBoxContainer/OwnerLabel.bbcode_text = "Owner: " + business_owner
	$MetaInfo/TitleLabel.bbcode_text = "[center]" + business_name + "[/center]"