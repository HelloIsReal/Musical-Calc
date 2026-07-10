extends Node2D
var question = preload("res://scenes/question.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	if(Global.chosenSong=="tutorial"):
		$songs/tutorial.play()
		$gameplayText.text = "Welcome to Musical Calc!"
		await get_tree().create_timer(3).timeout
		$gameplayText.text = "Welcome to Musical Calc!\nThe rhythm game about calculating numbers!"
		await get_tree().create_timer(5).timeout
		$gameplayText.text = "Here, let me show you the basics!"
		await get_tree().create_timer(3).timeout
		$gameplayText.text = "Here, let me show you the basics!"
		spawnQuestion(60,2)
		await get_tree().create_timer(3).timeout
		$gameplayText.text = "See this question coming down?"
		await get_tree().create_timer(4).timeout
		$gameplayText.text = "See this question coming down?\n Answer it in the box below!"


func spawnQuestion(speed,waitTime):
	print("spawn!")
	var newQuestion = question.instantiate()
	get_tree().current_scene.add_child(newQuestion)
	newQuestion.questionSpeed=speed
	await get_tree().create_timer(waitTime).timeout
	newQuestion.canMove=true
