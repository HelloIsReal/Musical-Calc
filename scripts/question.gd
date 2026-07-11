extends Node2D
@onready var answerBox = get_tree().current_scene.get_node("answer")

var chosenQuestion=0
var questionSpeed=200
var rng = RandomNumberGenerator.new()
var additionEasy = ["1+1","1+3","2+1","1+0","2+3","2+2","0+0","3+1","3+2","1+2","0+1","1+4","4+1"]
var additionEasyAnswers = [2,4,3,1,5,4,0,4,5,3,1,5,5]
var canMove=false

func _ready():
	position = Vector2(rng.randi_range(-900,700),-600)
	chosenQuestion = rng.randi_range(0,additionEasy.size()-1)
	$Label.text = additionEasy[chosenQuestion]
	
	

func _physics_process(delta):
	if(canMove):
		position.y += questionSpeed * delta


func _on_area_entered(area):
	if area.is_in_group("passDetector"):
		if int(answerBox.text) == additionEasyAnswers[chosenQuestion]:
			answerBox.clear()
			print("Correct answer!")
			#get_tree().current_scene.get_node("answer").clear()
			Global.correctAnswer.emit()
			queue_free()
	if area.is_in_group("failDetector"):
		#get_tree().current_scene.get_node("answer").clear()
		answerBox.clear()
		Global.combo=0
		Global.score-=100
		await get_tree().create_timer(5).timeout
		queue_free()
