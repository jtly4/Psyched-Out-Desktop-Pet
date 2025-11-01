extends Sprite2D

@onready var animationPlayer = $AnimationPlayer

@export var maxX: int = 2104
@export var minX: int = 100
@export var moveMaxCooldown: float = 10
@export var moveMinCooldown: float = 2
@export var maxMoveLength: float = 800
@export var minMoveLength: float = 100
@export var walkSpeed: int = 500


var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var moving: bool = false

var _maxX: int
var _minX: int
var targetX: int = 0
var cooldown: float = 0
var _screenSize: Vector2i
var _screenCenter: Vector2i

func _ready() -> void:
	setup()

func setup() -> void:
	_screenSize = DisplayServer.screen_get_size()
	_screenCenter = _screenSize / 2
	
	_maxX = _screenSize[0] - 100
	_minX = 100
	print("max: %d, min: %d" % [_maxX, _minX])
	
func _process(delta: float) -> void:
	_screenSize = DisplayServer.window_get_size()
	if _screenSize[0] - 100 != _maxX:
		_maxX = _screenSize[0] - 100
		print("max: %d, min: %d" % [_maxX, _minX])
	if moving:
		_move_towards_target(delta)
	else:
		cooldown -= delta
		if cooldown <= 0:
			_new_move_target()

func _move_towards_target(delta: float) -> void:
	var diff = position.x - targetX
	if diff == 0:
		moving = false
		cooldown = rng.randf_range(moveMinCooldown, moveMaxCooldown)
		return
	if abs(diff) < walkSpeed * delta:
		position.x = targetX
	elif diff > 0:
		position -= Vector2(walkSpeed * delta, 0)
	else:
		position += Vector2(walkSpeed * delta, 0)

func _new_move_target() -> void:
	var moveLength = rng.randf_range(minMoveLength, maxMoveLength)
	var direction = _generate_direction()
	moveLength *= direction
	targetX = clampf(position.x + moveLength, _minX, _maxX)
	print(targetX)
	moving = true

func _generate_direction() -> int:
	# check if close enough to edge, move away from edge if so
	if position.x - minMoveLength < _minX:
		return 1
	if position.x + minMoveLength > _maxX:
		return -1
	return 1 if rng.randf() > 0.5 else -1 # randomly return 1 or -1
