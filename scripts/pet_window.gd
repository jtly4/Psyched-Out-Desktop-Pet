extends Window

@export var maxX: int = 400
@export var minX: int = -400
@export var moveMaxCooldown: float = 10
@export var moveMinCooldown: float = 2
@export var walkSpeed: int = 500

var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var moving: bool = false
var _maxX: int
var _minX: int
var targetX: int = 0
var cooldown: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup()
	#get_tree().get_root().mouse_passthrough = true
	#get_tree().get_root().mouse_passthrough_polygon = []

func setup() -> void:
	print("a")
	_maxX = position.x + maxX
	_minX = position.x + minX
	print("max: %d, min: %d" % [_maxX, _minX])
	transparent_bg = true
	transparent = true
	borderless = true
	size = Vector2i(200, 200)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(get_window().position.x)
	if moving:
		_move_towards_target(delta)
	else:
		cooldown -= delta
		if cooldown <= 0:
			_new_move_target()

func _move_towards_target(delta: float) -> void:
	var diff = get_window().position.x - targetX
	print(diff)
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
