extends Area2D

@export var bump_force: float = 6000
@onready var explosion_sfx = $ExplosionSFX

func _ready():
	explosion_sfx.stream = load("res://Audio/explosion.wav")
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body is Ball:
		# play the sfx
		explosion_sfx.play()
		# Bounce the ball away from the bumper
		var direction = (body.global_position - global_position).normalized()
		body.apply_central_impulse(direction * bump_force)

		# Award points
		var awarded_points = 100
		get_parent().tnt_point()

		# Spawn the pop-up image at the bumper's position
		if GameState.double == true:
			spawn_popup_image(global_position, awarded_points * 2)
		else:
			spawn_popup_image(global_position, awarded_points)

		print("TNT Hit! Money: ", GameState.money)
	elif body is Ball2:
		# play the sfx
		explosion_sfx.play()
		# Bounce the ball away from the bumper
		var direction = (body.global_position - global_position).normalized()
		body.apply_central_impulse(direction * bump_force)

		# Award points
		var awarded_points = 100
		get_parent().tnt_point()

		# Spawn the pop-up image at the bumper's position
		if GameState.double == true:
			spawn_popup_image(global_position, awarded_points * 2)
		else:
			spawn_popup_image(global_position, awarded_points)

		print("Bumper Hit! Money: ", GameState.money)

func spawn_popup_image(bumper_position: Vector2, points: int):
	# Create a Sprite2D for the popup
	var popup = Sprite2D.new()
	
	# Place the popup at the bumper's position
	popup.global_position = bumper_position
	popup.z_index = 100  # Draw on top
	
	# Load the appropriate image
	match points:
		50:
			popup.texture = load("res://img/50.png")
		100:
			popup.texture = load("res://img/100.png")
		200:
			popup.texture = load("res://Textures/200_points.png")
		_:
			popup.texture = load("res://img/50.png")  # fallback

	# Scale down the image
	popup.scale = Vector2(0.5, 0.5)

	# Add the popup to the current scene
	var current_scene = get_tree().current_scene
	if current_scene == null:
		push_error("No current scene found!")
		return
	current_scene.add_child(popup)

	# Animate the popup: move upward and fade out
	var tween = get_tree().create_tween()
	tween.tween_property(popup, "global_position:y", popup.global_position.y - 50, 1.0)
	tween.tween_property(popup, "modulate:a", 0.0, 1.0)

	# Remove the popup after the tween finishes
	tween.connect("finished", Callable(popup, "queue_free"))
