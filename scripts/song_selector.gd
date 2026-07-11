extends Node2D

func _ready():
	Global.combo=0
	Global.score=0

# Tutorial song
func _on_tutorial_button_pressed():
	Global.chosenSong="tutorial"
	get_tree().change_scene_to_file("res://scenes/main.tscn")

# Josh Hutcherson Whistle song and the easy, normal, hard diffs
func _on_hutcherson_whistle_button_easy_pressed():
	Global.chosenSong="hutchWhistleEasy"
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_hutcherson_whistle_button_normal_pressed():
	Global.chosenSong="hutchWhistleNormal"
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_hutcherson_whistle_button_hard_pressed():
	Global.chosenSong="hutchWhistleHard"
	get_tree().change_scene_to_file("res://scenes/main.tscn")
