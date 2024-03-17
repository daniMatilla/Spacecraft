extends Control

func _on_btn_exit_pressed():
	get_tree().quit()

func _on_btn_start_pressed():
	get_tree().change_scene_to_file("res://assets/level/level.tscn")
