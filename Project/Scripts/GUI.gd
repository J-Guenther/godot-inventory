extends CanvasLayer

func _ready():
	Global.GUI = self

func update_GUI(money):
	$Money.text = money