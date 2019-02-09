extends Node

const itemImages = [
	preload("res://Sprites/Items/berries.png"),
	preload("res://Sprites/Items/grass.png"),
	preload("res://Sprites/Items/knife.png"),
];

# use: 0 means not usable
var itemDictionary = {
	0: {
		"name": "Berries",
		"buyValue": 5,
		"sellValue": 3,
		"itemIcon": itemImages[0],
		"description":"Tasty berries",
		"use": funcref(self, "use_berries")
	},
	1: {
		"name": "Grass",
		"buyValue": 2,
		"sellValue": 1,
		"itemIcon": itemImages[1],
		"description":"Dry grass",
		"use": null
	},
	2: {
		"name": "Knife",
		"buyValue": 100,
		"sellValue": 70,
		"itemIcon": itemImages[2],
		"description":"A sharp blade",
		"use": funcref(self, "use_knife")
	},
}


func use_berries():
	print("Used berry")


func use_knife():
	print("Used Knife")