extends Node2D


@onready var points_label = $PointsLabel  # Reference to the Label
@onready var score_label = $ScoreLabel  # Reference to the Label
@onready var bulletTime = $BulletTime
@onready var expeditionEnd = $ExpeditionEnd
@onready var ball = $Ball
@onready var ball2 = $Ball2
@onready var spawn_point = $SpawnPoint
@onready var double_label = $DoublePointsLabel
@onready var double_timer = $DoublePointsTimer
var time_left = 0  # 0 seconds

# global var for stuff

func _input(event):
	if event.is_action_pressed("toggle_slowmo"):
		if Engine.time_scale == 1.0:
			Engine.time_scale = 0.5  # Slow down
			bulletTime.start()
		else:
			Engine.time_scale = 1.0  # Return to normal
			bulletTime.stop()

func _on_timer_timeout():
	GameState.money -= 1
	update_points_label()
	
func update_points_label():
	points_label.text = "Money: " + str(GameState.money)  # Show updated points
	score_label.text = "High-Score: " + str(GameState.hiscore)  # Show updated points
	
func normal_point():
	if GameState.double == false:
		GameState.money += 50  # Increment points
	else:
		GameState.money += 100
		print("100 reached")
	update_points_label()  # Refresh the UI

func tnt_point():
	if GameState.double == false:
		GameState.money += 100  # Increment points
	else:
		GameState.money += 200  # Increment points
	update_points_label()  # Refresh the UI

func _ready():
	print("Pinball Game Started")
	GameState.money = 0
	GameState.balls_left = 3
	points_label.text = "Money: " + str(GameState.money)  # Show updated points
	score_label.text = "High-Score: " + str(GameState.hiscore)  # Show updated points
	
func update_timer_label():
	time_left = double_timer.get_time_left()  # Prevent negative time
	double_label.text = "Double Points Time Left: %02d" % [time_left]  # Format as SS
	
func _process(delta):
	time_left = max(double_timer.time_left, 0)  # Get remaining time
	update_timer_label()  # Update the visible timer
	
	if GameState.check_win_condition():
		get_tree().change_scene_to_file("res://level_one_clear.tscn")
	elif GameState.check_lose_condition():
		get_tree().change_scene_to_file("res://lose.tscn")

func _on_expedition_end_pressed() -> void:
	get_tree().change_scene_to_file("res://lose.tscn")


func _on_new_ball_pressed() -> void:
	GameState.money -= 50
	update_points_label()
	ball.linear_velocity = Vector2.ZERO
	print(spawn_point.position)
	ball.reset_ball(spawn_point.position)
	
func _on_double_points_pressed() -> void:
	GameState.money -= 200
	update_points_label()
	GameState.double = true
	time_left = 10
	double_timer.start()
	update_timer_label()

func _on_double_points_timer_timeout() -> void:
	GameState.double = false


func _on_new_ball_2_pressed() -> void:
	GameState.money -= 400
	update_points_label()
	ball2.linear_velocity = Vector2.ZERO
	print(spawn_point.position)
	ball2.reset_ball2(spawn_point.position)
