extends StaticBody2D

# Rocks should NOT apply impulse; they're static obstacles.
func _on_body_entered(body):
	if body.name == "Ball":
		# No impulse applied; rock is purely static
		pass  # or remove this function entirely
