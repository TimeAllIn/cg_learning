extends Panel

signal button_pressed


func 按下按钮() -> void:
	emit_signal("button_pressed")
	pass


var focus_color
func 鼠标进入() -> void:
	focus_color = get_modulate()
	set_modulate(focus_color * Color(0.9,0.9,0.9,1))
	pass


func 鼠标离开() -> void:
	set_modulate(focus_color)
	pass # Replace with function body.
