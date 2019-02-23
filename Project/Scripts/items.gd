extends Node

const itemImages = [
	preload("res://Sprites/Items/licensed/book.png"),
	preload("res://Sprites/Items/licensed/gold_bar.png"),
	preload("res://Sprites/Items/licensed/gold_nugget.png"),
];

enum itemTypes{
	ressources,
	books,
	crafting
}

# use: null means not usable
# materials: key is the ressource id and value the amount
var itemDictionary = {
	0: {
		"name": "Coal",
		"type": itemTypes.ressources,
		"buyValue": 10,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 5,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/Ressources/st_t_08.PNG"),
		"description":"Simple coal",
		"use": null,
		"materials": null,
		"productionTime": 10
	},
	1: {
		"name": "Copper Ore",
		"type": itemTypes.ressources,
		"buyValue": 15,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 7,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/Ressources/st_t_02.PNG"),
		"description":"Someone propspected for copper and found it",
		"use": null,
		"materials": null,
		"productionTime": 10
	},
	2: {
		"name": "Iron Ore",
		"type": itemTypes.ressources,
		"buyValue": 20,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 10,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/Ressources/st_t_01.PNG"),
		"description":"Weapons are made of it",
		"use": null,
		"materials": null,
		"productionTime": 10
	},
	3: {
		"name": "Gold Ore",
		"type": itemTypes.ressources,
		"buyValue": 50,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 25,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/Ressources/st_t_06.PNG"),
		"description":"Precious",
		"use": null,
		"materials": null,
		"productionTime": 10
	},
	4: {
		"name": "Sandstone",
		"type": itemTypes.ressources,
		"buyValue": 15,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 7,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/Ressources/st_t_05.PNG"),
		"description":"Rare",
		"use": null,
		"materials": null,
		"productionTime": 10
	},
	5: {
		"name": "Oricalcum Ore",
		"type": itemTypes.ressources,
		"buyValue": 70,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 35,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/Ressources/ore_f_t_03.png"),
		"description":"Magical",
		"use": null,
		"materials": null,
		"productionTime": 10
	},
	6: {
		"name": "Stone",
		"type": itemTypes.ressources,
		"buyValue": 10,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 5,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/Ressources/st_t_09.PNG"),
		"description":"It comes from a quarry near this town",
		"use": null,
		"materials": null,
		"productionTime": 10
	},
	7: {
		"name": "Oak wood",
		"type": itemTypes.ressources,
		"buyValue": 10,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 5,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/Ressources/wd_t_07.png"),
		"description":"Good old oak",
		"use": null,
		"materials": null,
		"productionTime": 10
	},
	8: {
		"name": "Pine wood",
		"type": itemTypes.ressources,
		"buyValue": 10,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 5,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/Ressources/wd_t_01.PNG"),
		"description":"Good old pine",
		"use": null,
		"materials": null,
		"productionTime": 10
	},
	9: {
		"name": "Bright stone",
		"type": itemTypes.ressources,
		"buyValue": 10,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 5,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/Ressources/ore_01_n_t.PNG"),
		"description":"It is like stone but brighter",
		"use": null,
		"materials": null,
		"productionTime": 10
	},
	10: {
		"name": "Salt stone",
		"type": itemTypes.ressources,
		"buyValue": 10,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 5,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/Ressources/salt_t_01.png"),
		"description":"There is salt in it!",
		"use": null,
		"materials": null,
		"productionTime": 10
	},
	11: {
		"name": "Horseshoe",
		"type": itemTypes.crafting,
		"buyValue": 90,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 70,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/WoodMetal/183_t.png"),
		"description":"They bring luck",
		"use": null,
		"materials": {
			16: 2
		},
		"productionTime": 10
	},
	12: {
		"name": "Log",
		"type": itemTypes.crafting,
		"buyValue": 100,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 50,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/WoodMetal/193_t.PNG"),
		"description":"What's great for a snack and fits on your back?",
		"use": null,
		"materials": {
			7: 3
		},
		"productionTime": 10
	},
	13: {
		"name": "Woodcutter's Axe",
		"type": itemTypes.crafting,
		"buyValue": 100,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 50,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/WoodMetal/axe_t_01.PNG"),
		"description":"Great for cutting trees and hunting cannibals",
		"use": null,
		"materials": {
			16: 2,
			18: 1,
			12: 1
		},
		"productionTime": 10
	},
	14: {
		"name": "Metal boots",
		"type": itemTypes.crafting,
		"buyValue": 100,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 50,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/WoodMetal/boot_t_03.png"),
		"description":"Part of heavy armors",
		"use": null,
		"materials": {
			16: 4
		},
		"productionTime": 10
	},
	15: {
		"name": "Gold Bar",
		"type": itemTypes.crafting,
		"buyValue": 60,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 30,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/WoodMetal/in_t_01.png"),
		"description":"Precious gold",
		"use": null,
		"materials": {
			3: 3
		},
		"productionTime": 10
	},
	16: {
		"name": "Iron Bar",
		"type": itemTypes.crafting,
		"buyValue": 10,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 5,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/WoodMetal/in_t_02.png"),
		"description":"There is salt in it!",
		"use": null,
		"materials": {
			2: 3
		},
		"productionTime": 10
	},
	17: {
		"name": "Copper Bar",
		"type": itemTypes.crafting,
		"buyValue": 50,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 25,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/WoodMetal/in_t_04.png"),
		"description":"Made of copper ore",
		"use": null,
		"materials": {
			1: 3
		},
		"productionTime": 10
	},
	18: {
		"name": "Nails",
		"type": itemTypes.crafting,
		"buyValue": 30,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 15,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/WoodMetal/pt_t_03.png"),
		"description":"Nailed it",
		"use": null,
		"materials": {
			16: 1
		},
		"productionTime": 10
	},
	19: {
		"name": "Sickle",
		"type": itemTypes.crafting,
		"buyValue": 60,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 30,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/WoodMetal/sickle_t_01.png"),
		"description":"Used for harvesting herbals",
		"use": null,
		"materials": {
			16: 2,
			12: 1
		},
		"productionTime": 10
	},
	20: {
		"name": "Gold jewelry",
		"type": itemTypes.crafting,
		"buyValue": 200,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 100,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/WoodMetal/sp_t_01.png"),
		"description":"Looks expensive",
		"use": null,
		"materials": {
			15: 2,
			5: 1
		},
		"productionTime": 10
	},
	21: {
		"name": "Sword",
		"type": itemTypes.crafting,
		"buyValue": 100,
		"buyValueMax": 0,
		"buyValueMin": 0,
		"sellValue": 50,
		"sellValueMax": 0,
		"sellValueMin": 0,
		"itemIcon": preload("res://Sprites/Items/licensed/WoodMetal/t_05_a.png"),
		"description":"A sharp blade",
		"use": null,
		"materials": {
			16: 3,
			12: 1
		},
		"productionTime": 10
	},
}


func use_book():
	print("Used berry")
