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

# Создаем окно уведомления и текстуру
@onready var result_popup = $ResultPopup
@onready var result_label = $ResultPopup/Sprite2D/ResultLabel

# Ссылки на HintLabel для каждого персонажа
@onready var hint_label_1 = $HintLabel/HintLabel1
@onready var hint_label_2 = $HintLabel/HintLabel2
@onready var hint_label_3 = $HintLabel/HintLabel3

func _ready():
	hide_all_hints()

# Функция для отображения подсказок
func show_hint(person):
	hide_all_hints()
	match person:
		"Person1":
			hint_label_1.text = hints[person]
			hint_label_1.show()
		"Person2":
			hint_label_2.text = hints[person]
			hint_label_2.show()
		"Person3":
			hint_label_3.text = hints[person]
			hint_label_3.show()

# Функция для скрытия всех подсказок
func hide_all_hints():
	hint_label_1.hide()
	hint_label_2.hide()
	hint_label_3.hide()

# Обработчики для перетаскивания предметов
func _on_Item1_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected_item = $Items/Item1
			dragging = true
		else:
			dragging = false
			check_drop()

func _on_Item2_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected_item = $Items/Item2
			dragging = true
		else:
			dragging = false
			check_drop()

func _on_Item3_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected_item = $Items/Item3
			dragging = true
		else:
			dragging = false
			check_drop()

func _process(_delta):
	if dragging and selected_item:
		var mousepos = get_viewport().get_mouse_position()
		selected_item.position = Vector2(mousepos.x, mousepos.y)

# Проверка правильности выбора
func check_match(person, item):
	if correct_pairs[person] == item:
		show_result("Correctly!")
	else:
		show_result("Wrong, try again.")

# Проверка, был ли предмет отпущен над персонажем
func check_drop():
	for person in ["Person1", "Person2", "Person3"]:
		if is_entered[person]:
			check_match(person, selected_item.name)
			break

# Функция для отображения результата
func show_result(message):
	$ResultPopup/Sprite2D/ResultLabel.text = message
	$ResultPopup.popup_centered()

# Функция для скрытия окна при нажатии
func _on_ResultPopup_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		$ResultPopup.hide()

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
