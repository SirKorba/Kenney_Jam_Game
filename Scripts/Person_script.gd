extends Area2D

var person = null

func _ready():
	person = $".".name

func show_hint(person):
	$HintLabel.text = $"../..".hints[person]

func _on_area_entered(area):
	if area.name == $"../..".correct_pairs[person]:
		$"../..".is_entered[person] = true
		$"../..".current_pairs[person] = area.name
	else:
		$"../..".is_entered[person] = null
		$"../..".current_pairs[person] = null


func _on_area_exited(area):
	if area.name == $"../..".correct_pairs[person]:
		$"../..".is_entered[person] = false


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		show_hint(person)
		if $"../..".is_entered[person]:
			$"../..".check_match(person, $"../..".correct_pairs[person])
		elif $"../..".is_entered[person] == null:
			$"../..".check_match(person, " ")
