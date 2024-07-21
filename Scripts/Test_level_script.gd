extends Node

@export var correct_pairs = {}
@export var is_entered = {}
@export var hints = {}

var current_pairs = {}
var all_correct = false

func _ready():
	
	if len(correct_pairs) == len(is_entered) and len(is_entered) == len(hints):
		pass
	else:
		print("Error: not correct number of args in Level_Script")
		get_tree().quit()
	
	current_pairs = is_entered
	
	for per in current_pairs.keys():
		current_pairs[per] = null
	print(current_pairs)

func check_match(person, item):
	if correct_pairs[person] == item:
		show_result("Правильно!")
		current_pairs[person] = item
	else:
		show_result("Неправильно, попробуйте снова.")
	
	check_all_correct()
	
	if all_correct:
		$Complete_level_button.show()
		$Complete_level_button.disabled = false
		

func show_result(message):
	$Result.text = message

func check_all_correct():
	print(current_pairs)
	all_correct = true
	for person in current_pairs.keys():
		if current_pairs[person] != correct_pairs[person]:
			all_correct = false
			break
