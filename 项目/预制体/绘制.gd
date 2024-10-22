extends Panel

var father_node
var id:int

const block = preload("res://预制体/网格.tscn")


func _on_按钮_pressed() -> void:
	var temp_position :Vector3= father_node.find_position(id)
	if Data.draw:		
		if Data.draw_list.has(temp_position):

			return
		Data.draw_list[temp_position] = Data.draw_color 
		make_block(temp_position)
		Data.father_draw()

	elif Data.eraser:
		if Data.draw_list.has(temp_position):
			Data.draw_list.erase(temp_position)
			Data.block_list.get(temp_position).destory()
			Data.block_list.erase(temp_position)
			Data.father_draw()
			return

	elif Data.painter:
		if Data.draw_list.has(temp_position):
			Data.draw_list[temp_position] = Data.draw_color
			Data.block_list.get(temp_position).make_color(Data.draw_color)
			Data.father_draw()
			return

		pass
	
	pass

func make_block(make_position:Vector3):
	var temp_block = block.instantiate()
	Data.block_position.add_child(temp_block)
	temp_block.set_position(make_position)
	temp_block.make_color(Data.draw_color)
	
	Data.block_list[make_position] = temp_block 	
	pass

func draw_color(color:Color):
	$"背景颜色板".set_modulate(color)
