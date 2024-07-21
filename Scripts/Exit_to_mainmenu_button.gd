extends TextureButton

func _pressed():
	$Click_sound.play()
	await get_tree().create_timer(0.35).timeout
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
