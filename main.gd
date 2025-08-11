extends Node2D

@onready var character_sprite: Sprite2D = $Pet
@onready var character_polygon: Polygon2D = $Pet/Polygon2D
@onready var menu: Control

func _ready():
	var size: Vector2i = DisplayServer.screen_get_size()
	DisplayServer.window_set_size(size)
	
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		open_menu()
	
func open_menu():
	pass
		
		
