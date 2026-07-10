extends Node2D
var question = preload("res://scenes/question.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.correctAnswer.connect(correctAnswer)
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
		await get_tree().create_timer(8.5).timeout
		$gameplayText.text = "See? It's that easy!"
		await get_tree().create_timer(4).timeout
		$gameplayText.text = "See? It's that easy!\n(Unless you somehow missed it...)"
		await get_tree().create_timer(4).timeout
		$gameplayText.text = "Here's one more question, but faster!"
		spawnQuestion(200,1)
		await get_tree().create_timer(5).timeout
		$gameplayText.text = "That's it for this tutorial!"
		await get_tree().create_timer(3).timeout
		$gameplayText.text = "That's it for this tutorial!\nHave fun!!"
		await get_tree().create_timer(3).timeout
		Global.chosenSong="none"
		get_tree().change_scene_to_file("res://scenes/songSelector.tscn")


func spawnQuestion(speed,waitTime):
	print("spawn!")
	var newQuestion = question.instantiate()
	get_tree().current_scene.add_child(newQuestion)
	newQuestion.questionSpeed=speed
	await get_tree().create_timer(waitTime).timeout
	newQuestion.canMove=true

func correctAnswer():
	$correctAnswerSfx.play()
