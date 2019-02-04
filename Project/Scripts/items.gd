extends Node

const itemImages = [
	preload("res://Sprites/Items/berries.png"),
	preload("res://Sprites/Items/grass.png"),
	preload("res://Sprites/Items/knife.png"),
];

const itemDictionary = {
	0: {
		"name": "Berries",
		"buyValue": 456,
		"sellValue": 987,
		"itemIcon": itemImages[0],
		"description":"Tasty berries"
	},
	1: {
		"name": "Grass",
		"buyValue": 100,
		"sellValue": 987,
		"itemIcon": itemImages[1],
		"description":"Dry grass"
	},
	2: {
		"name": "Knife",
		"buyValue": 987,
		"sellValue": 987,
		"itemIcon": itemImages[2],
		"description":"A sharp blade"
	},
};