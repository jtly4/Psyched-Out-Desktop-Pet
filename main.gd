extends Node2D

@onready var character_sprite: Sprite2D = $Pet
@onready var character_polygon: Polygon2D = $Pet/Polygon2D
@onready var menu: Control
@onready var window = preload("res://pet_window.tscn")

func _ready():
	var new_window = window.instantiate()
	
	get_tree().root.add_child(new_window)
	
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		open_menu()
	
func open_menu():
	pass
		
		
