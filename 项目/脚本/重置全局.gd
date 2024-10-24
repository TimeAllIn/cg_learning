extends Panel

var temp_draw = {}

const block = preload("res://预制体/网格.tscn")

func 按钮按下() -> void:
	if Data.draw_list.is_empty():
		if temp_draw.is_empty():
			return
		Data.draw_list = temp_draw.duplicate()
		Data.father_draw()
		for i in Data.draw_list:
			make_block(i,Data.draw_list.get(i))
		temp_draw.clear()
		return
	for i in Data.block_position.get_children():
		i.queue_free()
		pass
	if Data.game_mode:
		Data.game_mode = false
		$"../画面/工程/开始游戏".set_visible(Data.game_mode)
	else:
		temp_draw = Data.draw_list.duplicate()
	Data.draw_list.clear()
	Data.block_list.clear()
	Data.father_draw()
	pass


func make_block(make_position:Vector3,draw_color:Color):
	var temp_block = block.instantiate()
	Data.block_position.add_child(temp_block)
	temp_block.set_position(make_position)
	temp_block.make_color(draw_color)
	Data.block_list[make_position] = temp_block 	
	pass
