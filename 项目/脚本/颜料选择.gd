extends "res://脚本/按钮.gd"

var to_color
@export var id:String

func _ready() -> void:
	to_color = get_modulate()
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ctrl") or NewData.state != 0:
		return
	if Input.is_action_just_released(id):
		NewData.draw_color = to_color
		NewData.color_show.set_modulate(NewData.draw_color)
func 按钮按下() -> void:
	NewData.draw_color = to_color
	NewData.color_show.set_modulate(NewData.draw_color)
	NewData.draw_state_change(NewData.last_state)
	pass
