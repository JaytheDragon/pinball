extends CharacterBody2D

@onready var flipper_sfx = $FlipperSFX

const ROTATION_SPEED_UP = 1800   # speed upwards clearly
const ROTATION_SPEED_DOWN = -1600 # speed returning clearly
const ROTATION_LIMIT_UP = 30    # upper rotation limit clearly
const ROTATION_LIMIT_DOWN = -10 # rest position clearly

func _ready():
	flipper_sfx.stream = load("res://Audio/flipper.wav")

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_right_flipper"):
		flipper_sfx.play()
	if Input.is_action_pressed("ui_right_flipper"):
		if rotation_degrees < ROTATION_LIMIT_UP:
			rotation_degrees += ROTATION_SPEED_UP * delta
			rotation_degrees = min(rotation_degrees, ROTATION_LIMIT_UP)
	else:
		if rotation_degrees > ROTATION_LIMIT_DOWN:
			rotation_degrees += ROTATION_SPEED_DOWN * delta
			rotation_degrees = max(rotation_degrees, ROTATION_LIMIT_DOWN)
