extends Container

onready var inventory = $Inventory
onready var audio_stream = $AudioStreamPlayer

export var workers = 0
var max_workers = 3
var assigned_workers = 0
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
	$MetaInfo/VBoxContainer/WorkersLabel.bbcode_text = "Workers: " + str(workers) + "/" + str(max_workers)
	$MetaInfo/VBoxContainer/StatusLabel.bbcode_text = "Business Level: " + str(business_lvl)
	$MetaInfo/VBoxContainer/Profession.bbcode_text = "Profession: " + business_profession
	$MetaInfo/VBoxContainer/OwnerLabel.bbcode_text = "Owner: " + business_owner
	$MetaInfo/TitleLabel.bbcode_text = "[center]" + business_name + "[/center]"

func _on_NewWorkerButton_pressed():
	if workers < max_workers:
		$Timer.start()
		$MetaInfo/VBoxContainer/NewWorkerButton.text = "...searching..."
		$MetaInfo/VBoxContainer/NewWorkerButton.disabled = true


func _on_Timer_timeout():
	workers += 1
	$MetaInfo/VBoxContainer/NewWorkerButton.text = "Recruit New Worker"
	$MetaInfo/VBoxContainer/NewWorkerButton.disabled = false
	update_ui()
	audio_stream.stream = Audio.new_worker
	audio_stream.play()

