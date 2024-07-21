extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".hide()
	$".".disabled = true



func _on_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels_menu.tscn")
