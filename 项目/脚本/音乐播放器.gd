extends Control

func _ready() -> void:
	NewData.music_animation = $"音乐"


func 音乐按钮() -> void:
	if NewData.is_music_ui:
		NewData.music_animation.play_backwards("音乐")
	else:
		NewData.music_animation.play("音乐")
	NewData.is_music_ui = !NewData.is_music_ui
	pass


func 导入音乐() -> void:
	$"../../文件夹相关/音乐导入".set_visible(true)
	pass

func load_mp3(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var sound = AudioStreamMP3.new()
	sound.data = file.get_buffer(file.get_length())
	return sound


@onready var get_music: AudioStreamPlayer = $"../../文件夹相关/音乐播放器"

var music
var now_time:float = 0

func 音乐导入(path: String) -> void:
	music = load_mp3(path)	
	get_music.set_stream(music)
	if get_music.get_stream_paused():
		get_music.set_stream_paused(false)
		is_stop = false
	get_music._set_playing(true)
	$"背景板/暂停/纹理".set_texture(b_ico)	
	now_time = 0
	pass

func _physics_process(delta: float) -> void:
	if get_music.is_playing() and music != null:
		if move_it:
			if Input.is_action_just_released("mouse_left"):
				move_it = false
			return	
		now_time += delta 
		var music_length = music.get_length()
		if now_time * get_music.get_pitch_scale() >= music_length:
			get_music.set_stream(null) 
		$"背景板/流程/滑动条".set_value((now_time * get_music.get_pitch_scale())/music_length)

var move_it:bool = false
func 过程滚动(to_value: float) -> void:
	if get_music.get_stream() == null:
		return
	move_it = true
	var music_length = get_music.get_stream().get_length()
	get_music.seek(music_length * to_value)	
	now_time = music_length * to_value
	pass
func 音乐完毕() -> void:
	get_music.set_stream(null) 
	pass
func 音量调整(to_value: float) -> void:
	get_music.set_volume_db(12 * to_value - 24)
	pass


func 音高调整(to_value: float) -> void:
	if to_value == 0:
		get_music.set_pitch_scale(0.01)
		return
	get_music.set_pitch_scale(2 * to_value)
	pass # Replace with function body.

var is_stop:bool = false
const a_ico = preload("res://素材/美化素材/暂停.png")
const b_ico = preload("res://素材/美化素材/播放.png")
func 暂停() -> void:
	if get_music.get_stream() == null:
		return
	is_stop = !is_stop
	
	if is_stop:		
		$"背景板/暂停/纹理".set_texture(a_ico)
	else:
		$"背景板/暂停/纹理".set_texture(b_ico)	
	get_music.set_stream_paused(is_stop)

	pass
