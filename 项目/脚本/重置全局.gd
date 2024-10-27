extends Panel

var temp_draw = {}

const block = preload("res://预制体/网格.tscn")

func 按钮按下() -> void:
	if NewData.draw_list.is_empty():
		if temp_draw.is_empty():
			return
		NewData.draw_list = temp_draw.duplicate()
		NewData.father_draw()
		for i in NewData.draw_list:
			make_block(i,NewData.draw_list.get(i))
		temp_draw.clear()
		return
	for i in NewData.block_position.get_children():
		i.queue_free()
		pass
	temp_draw = NewData.draw_list.duplicate()
	NewData.draw_list.clear()
	NewData.block_list.clear()
	NewData.father_draw()
	pass


func make_block(make_position:Vector3,draw_color:Color):
	var temp_block = block.instantiate()
	NewData.block_position.add_child(temp_block)
	temp_block.set_position(make_position)
	temp_block.make_color(draw_color)
	NewData.block_list[make_position] = temp_block 	
	pass
