extends "res://脚本/颜色.gd"

signal last_color(to_color:Color)

func 颜色传递(to_color: Color) -> void:
	$H.get_texture().get_gradient().set_color(1,to_color)	
	emit_signal("last_color",$H.get_texture().get_gradient().sample($"H/滑动条".value))
	pass 


func 自传递颜色(to_color: Color) -> void:
	emit_signal("last_color",to_color)
	pass
