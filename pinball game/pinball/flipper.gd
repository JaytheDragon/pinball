extends Node2D
class_name Flipper

# Whether this flipper is the left one.
@export var is_left: bool = true

# Default properties.
@export var rotation_speed: float = 15.0
@export var rest_angle: float = 0.0  # If left at 0, we'll set defaults in _ready()
@export var active_angle: float = 0.0

var is_active: bool = false

func _ready() -> void:
	# If no angles were set in the editor (i.e. are 0), then assign defaults based on flipper side.
	if is_left:
		if rest_angle == 0.0:
			rest_angle = 20.0
		if active_angle == 0.0:
			active_angle = -30.0
	else:
		if rest_angle == 0.0:
			rest_angle = 15.0
		if active_angle == 0.0:
			active_angle = 5.0
	rotation_degrees = rest_angle
	# Debug
	print("Flipper ready. is_left:", is_left, "rest_angle:", rest_angle, "active_angle:", active_angle)

func _physics_process(delta: float) -> void:
	var target_angle: float = active_angle if is_active else rest_angle
	rotation_degrees = lerp(rotation_degrees, target_angle, delta * rotation_speed)
	# Uncomment the next line for debug:
	# print("Flipper (", is_left, ") rotation:", rotation_degrees)

func activate() -> void:
	is_active = true
	# Debug: print("Flipper activated (", is_left, ")")

func release() -> void:
	is_active = false
	# Debug: print("Flipper released (", is_left, ")")
