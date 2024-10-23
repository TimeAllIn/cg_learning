extends Panel


func _process(delta: float) -> void:
	if $"相关设置/灵敏度/拉动条".mouse_in or $"相关设置/灵敏度/拉动条".is_mouse:
		Data.rorate_angle = snappedf(2 * $"相关设置/灵敏度/拉动条".value, 0.1)
		$"相关设置/灵敏度/数值".text = str(Data.rorate_angle)
		pass
	
	if $"相关设置/移动速度/拉动条".mouse_in or $"相关设置/移动速度/拉动条".is_mouse:
		Data.move_speed = snappedf(20 * $"相关设置/移动速度/拉动条".value, 0.1)

		$"相关设置/移动速度/数值".text = str(Data.move_speed)
		pass
	pass


func 退出() -> void:
	set_visible(false)
	pass


func 进入() -> void:
	set_visible(true)
	pass 
