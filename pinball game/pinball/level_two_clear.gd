extends Node2D


func _on_next_stage_pressed() -> void:
	get_tree().change_scene_to_file("res://second_level.tscn")


func _on_next_stage_2_pressed() -> void:
	get_tree().change_scene_to_file("res://third_level.tscn")
