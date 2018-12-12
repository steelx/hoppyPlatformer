extends TextureButton


func _toggled(button_pressed):
	get_tree().change_scene("res://Scenes/Level1.tscn")
	pass