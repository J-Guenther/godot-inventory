extends Container

var parent = null
onready var background = $Background
onready var material_grid = $MaterialContainer/MaterialGrid
onready var material_container = $MaterialContainer
var material_scene = load("res://Scenes/Material.tscn")
onready var audio_stream = $AudioStreamPlayer

export var product = 2
var materials = []

var assigned_workers = 0
var work_on_product = false # workers are assignes to work on the product
var progress = 0
var rate = 0
var production_time
var during_process = false # the process of producing the product
var pause = false

func _ready():
	initialize_layout()
	production_time = items.itemDictionary[product].productionTime
	


func _process(delta):
	if work_on_product and not pause:
		working_process(delta)


func initialize_layout():
	for material in items.itemDictionary[product].materials.keys():
		add_material(material, items.itemDictionary[product].materials[material])
	$Product/ItemIcon.texture = items.itemDictionary[product].itemIcon


func add_material(item_key, amount):
	var material_instance = material_scene.instance()
	material_instance.set_name("Material")
	material_instance.initialize_material(item_key, amount)
	material_grid.add_child(material_instance)
	materials.append(item_key)


func working_process(delta):
	if not during_process:
		if materials_available():
			print("Check for Materials")
			during_process = true
			remove_materials_from_inventory()
		else:
			pause = true
			audio_stream.stream = Audio.no_ressources
			audio_stream.play()
	else:
		if progress < 1:
			rate = 1.0 / (production_time / assigned_workers)
			progress += delta * rate
			$Product/ItemIcon/ProgressLabel.bbcode_text = "[center]" + str(progress) + "[/center]"
		else:
			print("Product is finished")
			parent.inventory.add_item_return_rest(product, 1) # TODO what if inventory is full?
			during_process = false
			progress = 0
			$Product/ItemIcon/ProgressLabel.bbcode_text = "[center]" + str(progress) + "[/center]"
			



func remove_materials_from_inventory():
	for material in materials:
		var item = material
		var amount = items.itemDictionary[product].materials[material]
		parent.inventory.remove_item(item, amount)


func materials_available():
	var material_availability = []
	for material in materials:
		var amount = items.itemDictionary[product].materials[material]
		var available = false
		for slot in parent.inventory.slots:
			if slot.contains_same_item(material) and slot.current_item_amount >= amount:
				available = true
		material_availability.append(available)
	
	if false in material_availability:
		return false
	else:
		return true
	


func _on_ButtonUp_pressed():
	if parent.workers > 0:
		parent.workers -= 1
		assigned_workers += 1
		$WorkerToggle/WorkerLabel.text = str(assigned_workers)
		parent.update_ui()
		work_on_product = true
		
	else:
		print("Not enough workers available!")


func _on_ButtonDown_pressed():
	if assigned_workers > 0:
		parent.workers += 1
		assigned_workers -=1
		$WorkerToggle/WorkerLabel.text = str(assigned_workers)
		parent.update_ui()
		if assigned_workers == 0:
			work_on_product = false


func _on_inventory_change():
	print("Inventory changed")
	if work_on_product and pause:
		pause = false