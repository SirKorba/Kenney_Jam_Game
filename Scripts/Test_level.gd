extends Node2D

var selected_item = null
var dragging = false
var current_person = null

signal dragsignal

# Словарь для хранения соответствий между персонажами и предметами
var correct_pairs = {
	"Person1_Area": "Item1",
	"Person2_Area": "Item2",
	"Person3_Area": "Item3"
}

# Подсказки для персонажей
var hints = {
	"Person1_Area": "Я люблю читать.",
	"Person2_Area": "Мне нравится слушать музыку.",
	"Person3_Area": "Я всегда ношу ключи с собой."
}

# Функция для отображения подсказок
func show_hint(person):
	$HintLabel.text = hints[person]

# Обработчики для перетаскивания предметов
func _on_Item1_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected_item = $Item1
			dragging = true
		else:
			dragging = false
			if current_person:
				check_match(current_person.name, selected_item.name)

func _on_Item2_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected_item = $Item2
			dragging = true
		else:
			dragging = false
			if current_person:
				check_match(current_person.name, selected_item.name)

func _on_Item3_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			selected_item = $Item3
			dragging = true
		else:
			dragging = false
			if current_person:
				check_match(current_person.name, selected_item.name)

# Обработчики для каждого персонажа
func _on_Person1_Area_mouse_entered():
	current_person = $person1/Person1_Area

func _on_Person1_Area_mouse_exited():
	current_person = null

func _on_Person2_Area_mouse_entered():
	current_person = $person2/Person2_Area

func _on_Person2_Area_mouse_exited():
	current_person = null

func _on_Person3_Area_mouse_entered():
	current_person = $person3/Person3_Area

func _on_Person3_Area_mouse_exited():
	current_person = null

# Привязка сигналов кнопок
func _ready():
	show_hint("Person1_Area")
	show_hint("Person2_Area")
	show_hint("Person3_Area")

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
	selected_item = null
	dragging = false
