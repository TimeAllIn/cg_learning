extends Panel

var temp_player

func 是否可见() -> void:
	if is_visible():
		temp_player = null
		$"../../../文本".set_text("课程设计项目之游戏模式")
		Data.game_mode = true
		
	else :
		$"../../../文本".set_text("课程设计项目")
		Data.game_mode = false
		if temp_player != null:
			temp_player.queue_free()
		temp_player = null
		$"../../../游戏纹理".set_visible(false)
	pass 
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		set_visible(false)
		Input.set_mouse_mode(0)
		
const player = preload("res://预制体/游戏空间/玩家.tscn")
func 开始游戏() -> void:
	if temp_player != null:
		return
	for i in Data.draw_list:
		if Data.draw_list.get(i) == Data.color_array[9]:
			for block in Data.block_position.get_children():
				if block == Data.block_list.get(i):
					block.queue_free()
					break
				pass
			Data.draw_list.erase(i)
			Data.block_list.erase(i)
			Data.father_draw()
			temp_player = player.instantiate()
			$"../../../三维世界/游戏屏幕".add_child(temp_player)
			temp_player.position = i
			temp_player.move_speed = Data.move_speed * 0.5
			temp_player.rotate_speed = Data.rorate_angle * 2
			$"../../../游戏纹理".set_visible(true)
			temp_player.color = Data.color_array[9]
			temp_player.look_screen = $"../../../游戏纹理/游戏纹理"
			temp_player.start()

			break
			pass
	pass 
