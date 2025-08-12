extends Node2D

#@onready var character_sprite: Sprite2D = $Pet
#@onready var character_polygon: Polygon2D = $Pet/Polygon2D
@onready var menu: Control
var window = preload("res://pet_window.tscn")

func _ready():
	print("v")
	var new_window = window.instantiate()
	add_child(new_window)
	new_window.popup_centered()
	new_window.setup()
	
	
	
func _input(event):
	if event is InputEventMouseButton:
		open_menu()
	
func open_menu():
	pass
		
		
