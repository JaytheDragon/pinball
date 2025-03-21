extends Node2D

@onready var score_label = $ScoreLabel  # Reference to the Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_label.text = "High-Score: " + str(GameState.hiscore)  # Show updated points


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_rules_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Rules.tscn")	

func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")
