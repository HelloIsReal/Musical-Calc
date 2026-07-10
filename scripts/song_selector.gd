extends Node2D



func _on_tutorial_button_pressed():
	Global.chosenSong="tutorial"
	get_tree().change_scene_to_file("res://scenes/main.tscn")
