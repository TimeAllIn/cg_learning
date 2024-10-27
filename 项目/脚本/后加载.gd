extends Node

func _ready() -> void:
	if ResourceLoader.exists("user://setting.res"):
		var load_file = ResourceLoader.load("user://setting.res") as save_data
		if load_file.back_ground != null:
			NewData.back_texture.set_texture(load_file.back_ground)
