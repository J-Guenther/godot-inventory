extends Node

const itemImages = [
	preload("res://Sprites/Items/berries.png"),
	preload("res://Sprites/Items/grass.png"),
	preload("res://Sprites/Items/knife.png"),
];

const itemDictionary = {
	0: {
		"itemName": "Berries",
		"itemBuyValue": 456,
		"itemSellValue": 987,
		"itemIcon": itemImages[0]
	},
	1: {
		"itemName": "Grass",
		"itemBuyValue": 100,
		"itemSellValue": 987,
		"itemIcon": itemImages[1]
	},
	2: {
		"itemName": "Knife",
		"itemBuyValue": 987,
		"itemSellValue": 987,
		"itemIcon": itemImages[2]
	},
};