extends Panel

signal back_color(to_color:Color)

func 值发生改变(to_value: float) -> void:
	var color_value = snappedf(255 * to_value, 0.1)
	$"输入框".set_text(str(color_value))
	
	var my_texture = $H.get_texture().get_gradient()
	var back_color = my_texture.sample(to_value)
	emit_signal("back_color",back_color)
	#print(back_color)
	pass


func 玩家自定义颜色(new_text: String) -> void:
	var set_value = float(new_text)
	if set_value <0:
		set_value = 0
	elif set_value > 255:
		set_value = 255
		pass
	$"H/滑动条".set_value(set_value/255)
	值发生改变(set_value/255)
	pass

func make_text(new_value:float):
	var color_value = snappedf(new_value, 0.1)
	$"输入框".set_text(str(color_value))
