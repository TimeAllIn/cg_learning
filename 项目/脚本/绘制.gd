extends Panel

var father_node
var id:int

const block = preload("res://预制体/网格.tscn")


func _on_按钮_pressed() -> void:
	if NewData.state != 0 or NewData.is_music_ui:
		return
	var temp_position :Vector3= father_node.find_position(id)
	if NewData.draw_state == 0:		
		if NewData.draw_list.has(temp_position):
			return
		NewData.draw_list[temp_position] = NewData.draw_color 
		make_block(temp_position)
		NewData.father_draw()

	elif NewData.draw_state == 1:
		if NewData.draw_list.has(temp_position):
			NewData.draw_list.erase(temp_position)
			NewData.block_list.get(temp_position).destory()
			NewData.block_list.erase(temp_position)
			NewData.father_draw()
			return

	elif NewData.draw_state == 2:
		if NewData.draw_list.has(temp_position):
			NewData.draw_list[temp_position] = NewData.draw_color
			NewData.block_list.get(temp_position).make_color(NewData.draw_color)
			NewData.father_draw()
			return

		pass
	
	pass

func make_block(make_position:Vector3):
	var temp_block = block.instantiate()
	NewData.block_position.add_child(temp_block)
	temp_block.set_position(make_position)	
	temp_block.make_color(NewData.draw_color)
	NewData.block_list[make_position] = temp_block 	
	
	
	pass

func draw_color(color:Color):
	$"背景颜色板".set_modulate(color)


func _on_按钮_mouse_entered() -> void:
	if Input.is_action_pressed("mouse_left"):
		_on_按钮_pressed()
	pass # Replace with function body.
