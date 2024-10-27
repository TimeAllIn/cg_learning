extends Panel

var mouse_in:bool 

func 鼠标进入() -> void:
	$"介绍".set_visible(true)

	pass


func 鼠标离开() -> void:
	$"介绍".set_visible(false)

	pass
