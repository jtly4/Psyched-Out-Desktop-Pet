extends HBoxContainer


# @onready var spriteActive = false
@onready var zimbo = $Zimbo
# zimbo = [portrait, actual sprite]
# load("res://sprites/Zimbo Neutral.png")
@onready var yuno = $Yuno
@onready var skibby = $Skibby
@onready var dee = $Dee
var sprites = [zimbo, yuno, skibby, dee]

var currentSprite = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

# load the pet sprite onto the window
func _selected(name) -> void:
	currentSprite = sprites.find(name)
	
func _process(delta: float) -> void:
	pass
