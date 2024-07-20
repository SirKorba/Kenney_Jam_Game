extends Control

@onready var start_button = $StartButton
@onready var exit_button = $ExitButton


func _ready():
	start_button.connect("pressed", Callable(self, "_on_StartButton_pressed"))
	exit_button.connect("pressed", Callable(self, "_on_ExitButton_pressed"))

	# Установка режима окна и элементов управления
	if OS.has_feature("borderless_window"):
		get_tree().get_root().set_resizable(false)

func _on_start_button_pressed(): # Переход к Levels
	print("Start button pressed")
	get_tree().change_scene_to_file("res://scenes/Levels")

func _on_exit_button_pressed(): # Выход из игры
	print("Exit button pressed")
	get_tree().quit()


