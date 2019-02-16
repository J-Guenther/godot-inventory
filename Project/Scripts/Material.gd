extends TextureButton

var item_key = 0
var amount = 0

func initialize_material(key, amount):
	item_key = key
	$Item.texture = items.itemDictionary[key].itemIcon
	$RichTextLabel.bbcode_text = "[center]" + str(amount) + "[/center]"
	