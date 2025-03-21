extends Node2D

@onready var left_flipper: Node2D = $LeftFlipper
@onready var right_flipper: Node2D = $RightFlipper

func _ready() -> void:
	print("Main scene ready.")
	print("LeftFlipper node:", left_flipper)
	print("RightFlipper node:", right_flipper)

#func _physics_process(delta: float) -> void:
	## Check input for left flipper (e.g., key Q mapped to "flipper_left")
	#if Input.is_action_pressed("flipper_left"):
		#left_flipper.activate()
	#else:
		#left_flipper.release()
	#
	## Check input for right flipper (e.g., key W mapped to "flipper_right")
	#if Input.is_action_pressed("flipper_right"):
		#right_flipper.activate()
	#else:
		#right_flipper.release()
