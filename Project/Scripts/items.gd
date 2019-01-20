extends Node

const itemImages = [
	preload("res://Sprites/Items/berries.png"),
	preload("res://Sprites/Items/grass.png"),
	preload("res://Sprites/Items/knife.png"),
];

const itemDictionary = {
	0: {
		"itemName": "Berries",
		"itemValue": 456,
		"itemIcon": itemImages[0]
	},
	1: {
		"itemName": "Grass",
		"itemValue": 100,
		"itemIcon": itemImages[1]
	},
	2: {
		"itemName": "Knife",
		"itemValue": 987,
		"itemIcon": itemImages[2]
	},
};