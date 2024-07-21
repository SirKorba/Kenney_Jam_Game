extends Node

@export var correct_pairs = {}
@export var is_entered = {}
@export var hints = {}

func _ready():
	if len(correct_pairs) == len(is_entered) and len(is_entered) == len(hints):
		pass
	else:
		print("Error: not correct number of args in Level_Script")
		get_tree().quit()	

func check_match(person, item):
	if correct_pairs[person] == item:
		show_result("Правильно!")
	else:
		show_result("Неправильно, попробуйте снова.")

func show_result(message):
	$Result.text = message
