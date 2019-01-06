extends CanvasLayer

var isOpen = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_pressed():
	if isOpen:
		isOpen = !isOpen
		$Inventory.hide()
	else:
		isOpen = !isOpen
		$Inventory.popup_centered()
