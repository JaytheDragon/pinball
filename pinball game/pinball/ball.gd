extends RigidBody2D
class_name Ball

func _ready():
	gravity_scale = 1
	contact_monitor = true
	max_contacts_reported = 5 

func _on_body_entered(body):
	if body.is_in_group("resources"):
		GameState.money += body.resource_value
		body.queue_free()
		
var reset_position: Vector2 = Vector2.ZERO
var reset_requested: bool = false

func reset_ball(new_position: Vector2):
	reset_position = new_position
	reset_requested = true

func _integrate_forces(state):
	if reset_requested:
		state.transform = Transform2D(0, reset_position)  # Move ball
		state.linear_velocity = Vector2.ZERO  # Stop movement
		state.angular_velocity = 0  # Stop rotation
		reset_requested = false
