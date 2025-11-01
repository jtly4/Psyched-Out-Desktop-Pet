class_name characterSelect extends OptionButton


func _on_item_selected(index: int):
	match index:
		0: return "Zimbo"
		1: return "Yuno"
		2: return "Skibby"
		3: return "Dee"
		4: return "No One"
