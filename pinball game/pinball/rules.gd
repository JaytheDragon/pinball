extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Start.tscn")

func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://Rules2.tscn")


func _on_next_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.
