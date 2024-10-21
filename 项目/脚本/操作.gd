extends Panel
@export var id:int = 0
func _ready() -> void:
	Data.button_array.append(self)

func _on_按钮_pressed() -> void:
	for i in Data.button_array:
		i.set_modulate(Data.not_select_color)
	set_modulate(Data.select_color)
	if id == 0:
		Data.draw = true
		Data.eraser = false
		Data.painter = false
	elif id == 1:
		Data.draw = false
		Data.eraser = true
		Data.painter = false
	elif id == 2:
		Data.draw = false
		Data.eraser = false
		Data.painter = true
	pass
