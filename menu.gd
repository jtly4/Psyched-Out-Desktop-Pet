extends Control


# signal confirmed(is_confirmed: bool)

@onready var selectedCharacter: OptionButton = $Menu/Container/MarginContainer/VBoxContainer/VBoxContainer/CharacterSelect/DropDown
@onready var speed: Label = $Menu/Container/MarginContainer/VBoxContainer/VBoxContainer/Speed/SpeedOption
@onready var sizing: Label = $Menu/Container/MarginContainer/VBoxContainer/VBoxContainer/Size/SizeOption
@onready var confirm: Button = $Container/MarginContainer/VBoxContainer/Confirm
@onready var left: Button = $Container/MarginContainer/VBoxContainer/VBoxContainer/Speed/Left

# speed for the sprite
var SpeedOptions := [0.5, 1.0, 1.25, 1.5, 1.75, 2]
var character := ""
# size of the area they can walk around
# var SizingOptions := []



# Called when the node enters the scene tree for the first time.
func _on_confirm():
	# character = characterSelect._on_item_selected()
	pass
		
func _update_sprite():
	pass
	
func _update_speed():
	pass
	
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
