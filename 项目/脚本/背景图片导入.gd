extends Panel



func 导入图片() -> void:
	$"../../../../背景图导入".set_visible(true)
	pass


func 背景图选中(path: String) -> void:
	$"../路径".set_text(path)
	var bg_image = Image.load_from_file(path)
	Data.back_ground.set_texture(ImageTexture.create_from_image(bg_image))
	pass


func 音乐导入() -> void:
	$"../../../../音乐导入".set_visible(true)
	pass

func 音乐导入路径(path: String) -> void:
	var music = load_mp3(path)
	$"../../bgm导入/路径".set_text(path)
	$"../../../../音乐播放器".set_stream(music)
	$"../../../../音乐播放器"._set_playing(true)
	pass

func load_mp3(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var sound = AudioStreamMP3.new()
	sound.data = file.get_buffer(file.get_length())
	return sound



func _on_音量条_get_mouse_in(value: float) -> void:
	$"../../../../音乐播放器".set_volume_db(36*(value - 0.5 ))
	pass


func _on_音高条_get_mouse_in(value: float) -> void:
	$"../../../../音乐播放器".set_pitch_scale(2*(value))
	pass 
