extends Control


# signal confirmed(is_confirmed: bool)

@onready var selectedCharacter: OptionButton = $Menu/Container/MarginContainer/VBoxContainer/VBoxContainer/CharacterSelect/DropDown
@onready var sizing: Label = $Menu/Container/MarginContainer/VBoxContainer/VBoxContainer/Size/SizeOption
@onready var confirm: Button = $Container/MarginContainer/VBoxContainer/Confirm
@onready var left: Button = $Container/MarginContainer/VBoxContainer/VBoxContainer/Speed/Left




# speed for the sprite; default = 1
var currentSpeed = 1
var tempSpeed = 1 
var character := ""
var currentSize = "medium" #default = medium
var tempSize = ""
# size of the area they can walk around
# var SizingOptions := []

#selecting character
func _on_drop_down_item_selected(index: int) -> void:
	match index:
		0: character = "Zimbo"
		1: character = "Yuno"
		2: character = "Skibby"
		3: character = "Dee"
		4: character = "No One"
	
#selecting speed
func _on_drop_down_2_item_selected(index: int) -> void:
	match index:
		0: tempSpeed = .5
		1: tempSpeed = .75
		2: tempSpeed = 1
		3: tempSpeed = 1.25
		4: tempSpeed = 1.5
		5: tempSpeed = 1.75
		6: tempSpeed = 2
	print(tempSpeed)
	
#selecting size
func _on_size_drop_down_item_selected(index: int) -> void:
	match index:
		0: tempSize = "small"
		1: tempSize = "medium"
		2: tempSize = "large"
	print(tempSize)
	



# Called when the node enters the scene tree for the first time.
func _on_confirm():
	# character = characterSelect._on_item_selected()
	pass
		
func _update_sprite():
	pass
	
func _update_speed():
	currentSpeed = tempSpeed
	
func _update_window_size():
	pass
	
func _ready() -> void:
	confirm.button_down.connect(_on_confirm)
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Closes the menu window without losing sprite information
# reference psyched out shop
func _closeWindow() -> void:
	pass
	
# pick either idle or walking animation
func _animationType() -> void:
	pass
