extends TextureButton

var level
var scene = "res://Scenes/Levels/"

func _ready():
	level = get_node("Label").text
	
func _pressed():
	if level == "T":
		get_tree().change_scene_to_file("res://Scenes/Levels/Test_level.tscn")
	else:
		scene += level + "_level.tscn"
		get_tree().change_scene_to_file(scene)
