extends Panel

@export var chose_id:int


var mouse



func 接受颜色(to_color: Color) -> void:
	$"../调色板/显示颜色".set_modulate(to_color)
	$"容器".get_child(chose_id).set_modulate(to_color)
	$"容器".get_child(chose_id).to_color = to_color
	$"容器".get_child(chose_id).color_vector = Vector2($"../调色板/主体/H/滑动条".value * 255,$"../调色板/黑白/H/滑动条".value * 255)
	NewData.draw_color = to_color
	NewData.color_show.set_modulate(NewData.draw_color)
	pass
