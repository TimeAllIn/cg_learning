extends Node

func _ready() -> void:
	var is_ok = ResourceLoader.exists("user://data.res")
	if is_ok:
		var load_data = ResourceLoader.load("user://data.res") as save_data
		$"../背景图片/贴图纹理".set_texture(load_data.back_ground)
