extends Node

var money = 1000 setget update_money, update_money
var value_on_hand = 0

func _ready():
	Global.Player = self

func update_money(new_value):
	if money + new_value <= 0:
		money = 0
	else:
		money += new_value
	Global.GUI.update_GUI(money)