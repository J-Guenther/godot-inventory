extends Node

const itemImages = [
	preload("res://Sprites/Items/licensed/book.png"),
	preload("res://Sprites/Items/licensed/gold_bar.png"),
	preload("res://Sprites/Items/licensed/gold_nugget.png"),
];

# use: 0 means not usable
var itemDictionary = {
	0: {
		"name": "Book",
		"buyValue": 50,
		"sellValue": 30,
		"itemIcon": itemImages[0],
		"description":"Could be the Necronomicon",
		"use": funcref(self, "use_book")
	},
	1: {
		"name": "Gold Nugget",
		"buyValue": 100,
		"sellValue": 80,
		"itemIcon": itemImages[2],
		"description":"Golden and shiny",
		"use": null
	},
	2: {
		"name": "Gold Bar",
		"buyValue": 200,
		"sellValue": 150,
		"itemIcon": itemImages[1],
		"description":"It is heavy",
		"use": null,
		"materials": {
			1: 2
		}
	},
}


func use_book():
	print("Used berry")
