extends TextureButton

@export var level = "1"

var scene = "res://Scenes/Levels/"
var complete_level = 1

func _ready():
	if level != "T" and level != "T2" and int(level) > complete_level:
		disabled = true
		
	get_node("Label").text = level
	
func _pressed():
	
	$Click_sound.play()
	await get_tree().create_timer(0.35).timeout
	
	if level == "T":
		get_tree().change_scene_to_file("res://Scenes/Levels/Test_level.tscn")
	elif level == "T2":
		get_tree().change_scene_to_file("res://Scenes/Levels/Test_level2.tscn")
	else:
		scene += level + "_level.tscn"
		get_tree().change_scene_to_file(scene)
