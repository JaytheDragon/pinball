func buy_speed_boost():
	if GameState.money >= 50:
		GameState.money -= 50
		Ball.apply_impulse(Vector2.ZERO, Vector2(0, -1000))
