extends Node2D

var chosenQuestion=0
var questionSpeed=200
var rng = RandomNumberGenerator.new()
var additionEasy = ["1+1","1+3","2+1","1+0","2+3","2+2"]
var additionEasyAnswers = [2,4,3,1,5,4]
var canMove=false

func _ready():
	position = Vector2(rng.randi_range(-900,700),-600)
	chosenQuestion = rng.randi_range(0,additionEasy.size()-1)
	$Label.text = additionEasy[chosenQuestion]
	
	

func _physics_process(delta):
	if(canMove):
		position.y += questionSpeed * delta


func _on_area_entered(area):
	if area.is_in_group("detector"):
		print("detected!")
		if int(get_tree().current_scene.get_node("answer").text) == additionEasyAnswers[chosenQuestion]:
			print("Correct answer!")
			get_tree().current_scene.get_node("answer").clear()
			Global.correctAnswer.emit()
			queue_free()
		else:
			get_tree().current_scene.get_node("answer").clear()
			print("none/wrong answer!")
			await get_tree().create_timer(5).timeout
			queue_free()
