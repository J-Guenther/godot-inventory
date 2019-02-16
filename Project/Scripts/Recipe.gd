extends Container

onready var background = $Background
onready var material_grid = $MaterialContainer/MaterialGrid
onready var material_container = $MaterialContainer
var material_scene = load("res://Scenes/Material.tscn")

export var product = 2
var materials = []


func _ready():
	initialize_layout()
	pass


func initialize_layout():
	for material in items.itemDictionary[product].materials.keys():
		add_material(material, items.itemDictionary[product].materials[material])


func add_material(item_key, amount):
	var material_instance = material_scene.instance()
	material_instance.set_name("Material")
	material_instance.initialize_material(item_key, amount)
	material_grid.add_child(material_instance)