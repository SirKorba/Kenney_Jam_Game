extends TextureButton

@export var level = "1"
var scene = "res://Scenes/Levels/"

func _ready():
	if level != "T" and int(level) > 1:
		disabled = true
		
	get_node("Label").text = level
	
func _pressed():
	if level == "T":
		get_tree().change_scene_to_file("res://Scenes/Levels/Test_level.tscn")
	else:
		scene += level + "_level.tscn"
		get_tree().change_scene_to_file(scene)
