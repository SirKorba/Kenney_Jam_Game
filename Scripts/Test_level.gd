extends Node2D

var selected_item = null
var dragging = false

signal dragsignal

# Словарь для хранения соответствий между персонажами и предметами
var correct_pairs = {
	"Person1": "Item1",
	"Person2": "Item2",
	"Person3": "Item3"
}

var is_entered = {
	"Person1": false,
	"Person2": false,
	"Person3": false
}

# Подсказки для персонажей
var hints = {
	"Person1": "Я люблю читать.",
	"Person2": "Мне нравится слушать музыку.",
	"Person3": "Я всегда ношу ключи с собой."
}

# Функция для отображения подсказок
func show_hint(person):
	$HintLabel.text = hints[person]

# Обработчики для перетаскивания предметов
func _on_Item1_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected_item = $Items/Item1
			dragging = true
		else:
			dragging = false

func _on_Item2_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected_item = $Items/Item2
			dragging = true
		else:
			dragging = false

func _on_Item3_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected_item = $Items/Item3
			dragging = true
		else:
			dragging = false

func _process(_delta):
	if dragging and selected_item:
		var mousepos = get_viewport().get_mouse_position()
		selected_item.position = Vector2(mousepos.x, mousepos.y)

# Проверка правильности выбора
func check_match(person, item):
	if correct_pairs[person] == item:
		$ResultLabel.text = "Правильно!"
	else:
		$ResultLabel.text = "Неправильно, попробуйте снова."


func _on_person_1_area_entered(area):
	if area.name == "Item1":
		is_entered["Person1"] = true
	else:
		is_entered["Person1"] = null

func _on_person_2_area_entered(area):
	if area.name == "Item2":
		is_entered["Person2"] = true
	else:
		is_entered["Person2"] = null

func _on_person_3_area_entered(area):
	if area.name == "Item3":
		is_entered["Person3"] = true
	else:
		is_entered["Person3"] = null

func _on_person_1_area_exited(area):
	if area.name == "Item1":
		is_entered["Person1"] = false


func _on_person_2_area_exited(area):
	if area.name == "Item2":
		is_entered["Person2"] = false


func _on_person_3_area_exited(area):
	if area.name == "Item3":
		is_entered["Person3"] = false

func _on_person_1_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		show_hint("Person1")
		if is_entered["Person1"]:
			check_match("Person1", "Item1")
		elif is_entered["Person1"] == null:
			check_match("Person1", " ")

func _on_person_2_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		show_hint("Person2")
		if is_entered["Person2"]:
			check_match("Person2", "Item2")
		elif is_entered["Person2"] == null:
			check_match("Person1", " ")

func _on_person_3_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		show_hint("Person3")
		if is_entered["Person3"]:
			check_match("Person3", "Item3")
		elif is_entered["Person3"] == null:
			check_match("Person1", " ")

