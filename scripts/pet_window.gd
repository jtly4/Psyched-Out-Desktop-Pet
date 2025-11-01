extends Node

@export var maxX: int = 400
@export var minX: int = -400
@export var moveMaxCooldown: float = 10
@export var moveMinCooldown: float = 2
@export var walkSpeed: int = 500
@export var petAreaPolygons: Array[Polygon2D]

@onready var line := $"debugdraw/Line2D"

var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var moving: bool = false

var full_screen_detection := false
var _maxX: int
var _minX: int
var targetX: int = 0
var cooldown: float = 0
var _screenSize: Vector2i
var _screenCenter: Vector2i

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup()
	#get_tree().get_root().mouse_passthrough = true
	#get_tree().get_root().mouse_passthrough_polygon = []

func setup() -> void:
	DisplayServer.window_set_position(Vector2())
	_screenSize = DisplayServer.window_get_size()
	_screenCenter = _screenSize / 2
	get_window().size = DisplayServer.screen_get_size() - Vector2i(0, 1)
	
	get_window().always_on_top = true
	get_viewport().transparent_bg = true
	
	get_window().transparent_bg = true
	get_window().transparent = true
	get_window().borderless = true
	#size = Vector2i(200, 200)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_pet_area()
	#print(get_window().position.x)
	#if moving:
		#_move_towards_target(delta)
	#else:
		#cooldown -= delta
		#if cooldown <= 0:
			#_new_move_target()

func update_pet_area():
	if full_screen_detection:
		DisplayServer.window_set_mouse_passthrough([])
		return
	var polygons = []
	for p in petAreaPolygons:
		polygons.push_back(p.global_transform * p.polygon)

	var points := []
	points.clear()
	while _polygons_overlap(polygons):
		for i in range(polygons.size()):
			for i2 in range(polygons.size()):
				var pol = polygons[i]
				var pol2 = polygons[i2]
				if i == i2: continue
				if pol == null or pol2 == null: continue
				if _polygons_intersect(pol, pol2):
					polygons[i] = Geometry2D.merge_polygons(pol, pol2)[0]
					polygons[i2] = null
		
		while polygons.has(null):
			polygons.remove(polygons.find_last(null))
	
	points.push_back(Vector2())
	for poly in polygons:
		for p in poly:
			points.push_back(p)
		points.push_back(poly[0])
		points.push_back(Vector2())
		
	line.clear_points()
	for p in points:
		line.add_point(p)
	
	DisplayServer.window_set_mouse_passthrough(PackedVector2Array(points))


func _polygons_intersect(p1, p2)->bool:
#	prints("Inter:", Geometry.intersect_polygons_2d(p1, p2).size())
	return Geometry2D.intersect_polygons(p1, p2).size() > 0

func _polygons_overlap(polygons:Array)->bool:
	for i in range(polygons.size()):
		for i2 in range(polygons.size()):
			if i <= i2: continue
			if _polygons_intersect(polygons[i], polygons[i2]):
				return true
	return false

func _move_towards_target(delta: float) -> void:
	var diff = get_window().position.x - targetX
	if diff == 0:
		moving = false
		cooldown = rng.randf_range(moveMinCooldown, moveMaxCooldown)
		return
	if abs(diff) < walkSpeed * delta:
		get_window().position.x = targetX
	elif diff > 0:
		get_window().position -= Vector2i(walkSpeed * delta, 0)
	else:
		get_window().position += Vector2i(walkSpeed * delta, 0)

func _new_move_target() -> void:
	targetX = rng.randi_range(_minX, _maxX)
	moving = true
