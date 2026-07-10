extends Node2D

var chosenQuestion=0
var speed=500
var rng = RandomNumberGenerator.new()
var additionEasy = ["1+1","1+3","2+1","1+0","2+3","2+2"]
var additionEasyAnswers = [2,4,3,1,5,4]

func _ready():
	chosenQuestion = rng.randi_range(0,additionEasy.size()-1)
	$Label.text = additionEasy[chosenQuestion]
	

func _physics_process(delta):
	position.y += speed * delta


func _on_area_entered(area):
	if area.is_in_group("detector"):
		print("detected!")
		if int(get_tree().current_scene.get_node("answer").text) == additionEasyAnswers[chosenQuestion]:
			print("guh")
		else:
			print("sigma")
