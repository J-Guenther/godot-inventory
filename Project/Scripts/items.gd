extends Node

const itemImages = [
	preload("res://Sprites/Items/berries.png"),
	preload("res://Sprites/Items/grass.png"),
	preload("res://Sprites/Items/knife.png"),
];

const itemDictionary = {
	0: {
		"itemName": "Berries",
		"buyValue": 456,
		"sellValue": 987,
		"itemIcon": itemImages[0]
	},
	1: {
		"itemName": "Grass",
		"buyValue": 100,
		"sellValue": 987,
		"itemIcon": itemImages[1]
	},
	2: {
		"itemName": "Knife",
		"buyValue": 987,
		"sellValue": 987,
		"itemIcon": itemImages[2]
	},
};