extends Area2D

var selected_item = null
var dragging = false

func _ready():
	selected_item = $".".name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if dragging and selected_item:
		var mousepos = get_viewport().get_mouse_position()
		global_position = Vector2(mousepos.x, mousepos.y)

func check_drop(selected_item):
	for person in $"../..".correct_pairs.keys():
		if $"../..".is_entered[person]:
			$"../..".check_match(person, selected_item)
			break

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
		else:
			dragging = false
			check_drop(selected_item)
