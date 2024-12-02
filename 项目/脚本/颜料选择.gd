extends "res://脚本/按钮.gd"

var to_color

@export var id:int
@export var color_vector:Vector2 = Vector2(0,0)

func _ready() -> void:
	id = int(str(name))
	to_color = get_modulate()

func 按钮按下() -> void:
	NewData.draw_color = to_color
	NewData.color_show.set_modulate(NewData.draw_color)
	$"../..".chose_id = id
	
	$"../../../调色板/主体/H/滑动条".set_value(color_vector.x/255)
	$"../../../调色板/黑白/H/滑动条".set_value(color_vector.y/255)
	
	$"../../../调色板/主体".make_text(color_vector.x)
	$"../../../调色板/黑白".make_text(color_vector.y)
	
	$"../../../调色板/显示颜色".set_modulate(to_color)
	pass
