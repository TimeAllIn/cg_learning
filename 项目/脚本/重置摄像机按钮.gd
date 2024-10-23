extends Panel

var start_position:Vector3
var start_rotation:Vector3

func _ready() -> void:
	start_position = %"摄像机".position
	start_rotation = %"摄像机".get_rotation()
	pass

func 重置摄像机() -> void:
	%"摄像机".position = start_position
	%"摄像机".set_rotation(start_rotation)
	pass
