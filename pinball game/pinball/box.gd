extends StaticBody2D

var resource_value = 50

func _on_body_entered(body):
	if body.name == "Ball":
		GameState.money += resource_value
		queue_free()
		print("Collected Resource! Total Money: ", GameState.money)
