extends Node2D

# Переменные для хранения состояния
var selected_person = null
var selected_item = null

# Словарь для хранения соответствий между персонажами и предметами
var correct_pairs = {
	"person1": "item1",
	"person2": "item2",
	"person3": "item3"
}

# Подсказки для персонажей
var hints = {
	"person1": "Я люблю читать.",
	"person2": "Мне нравится слушать музыку.",
	"person3": "Я всегда ношу ключи с собой."
}

# Функция для отображения подсказок
func show_hint(person):
	$HintLabel.text = hints[person]

# Обработчики нажатия на кнопки персонажей
func _on_person_1_pressed():
	selected_person = "person1"
	show_hint("person1")

func _on_person_2_pressed():
	selected_person = "person2"
	show_hint("person2")

func _on_person_3_pressed():
	selected_person = "person3"
	show_hint("person3")

# Обработчики нажатия на кнопки предметов
func _on_item_1_pressed():
	selected_item = "item1"
	check_match()

func _on_item_2_pressed():
	selected_item = "item2"
	check_match()

func _on_item_3_pressed():
	selected_item = "item3"
	check_match()

# Проверка правильности выбора
func check_match():
	if selected_person and selected_item:
		if correct_pairs[selected_person] == selected_item:
			$ResultLabel.text = "Правильно!"
		else:
			$ResultLabel.text = "Неправильно, попробуйте снова."
		selected_person = null
		selected_item = null

# Привязка сигналов кнопок
func _ready():
	# Отключаем сигналы перед повторным подключением, чтобы избежать дублирования
	if $Person1.is_connected("pressed", Callable(self, "_on_person_1_pressed")):
		$Person1.disconnect("pressed", Callable(self, "_on_person_1_pressed"))
	$Person1.connect("pressed", Callable(self, "_on_person_1_pressed"))

	if $Person1/Person2.is_connected("pressed", Callable(self, "_on_person_2_pressed")):
		$Person1/Person2.disconnect("pressed", Callable(self, "_on_person_2_pressed"))
	$Person1/Person2.connect("pressed", Callable(self, "_on_person_2_pressed"))

	if $Person1/Person3.is_connected("pressed", Callable(self, "_on_person_3_pressed")):
		$Person1/Person3.disconnect("pressed", Callable(self, "_on_person_3_pressed"))
	$Person1/Person3.connect("pressed", Callable(self, "_on_person_3_pressed"))

	if $Item1.is_connected("pressed", Callable(self, "_on_item_1_pressed")):
		$Item1.disconnect("pressed", Callable(self, "_on_item_1_pressed"))
	$Item1.connect("pressed", Callable(self, "_on_item_1_pressed"))

	if $Item1/Item2.is_connected("pressed", Callable(self, "_on_item_2_pressed")):
		$Item1/Item2.disconnect("pressed", Callable(self, "_on_item_2_pressed"))
	$Item1/Item2.connect("pressed", Callable(self, "_on_item_2_pressed"))

	if $Item1/Item3.is_connected("pressed", Callable(self, "_on_item_3_pressed")):
		$Item1/Item3.disconnect("pressed", Callable(self, "_on_item_3_pressed"))
	$Item1/Item3.connect("pressed", Callable(self, "_on_item_3_pressed"))
