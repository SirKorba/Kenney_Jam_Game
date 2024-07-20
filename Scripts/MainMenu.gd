extends Control

@onready var start_button = $StartButton
@onready var exit_button = $ExitButton


func _ready():
	
	start_button.connect("pressed", Callable(self, "_on_StartButton_pressed"))
	exit_button.connect("pressed", Callable(self, "_on_ExitButton_pressed"))

	# Установка режима окна и элементов управления
	if OS.has_feature("borderless_window"):
		get_tree().get_root().set_resizable(false)

func _on_start_button_pressed():
	print("Start button pressed")
	$Click_sound.play()
	await get_tree().create_timer(0.35).timeout
	get_tree().change_scene_to_file("res://Scenes/Levels_menu.tscn")


func _on_exit_button_pressed():
	print("Exit button pressed")
	$Click_sound.play()
	await get_tree().create_timer(0.35).timeout
	get_tree().quit()
	
