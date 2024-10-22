extends Panel

func _ready() -> void:
	Data.color_array.append(get_modulate())

func _on_按钮_pressed() -> void:
	Data.change_color(get_modulate())
	pass 
