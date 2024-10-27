extends Control
func _ready() -> void:

	NewData.state_animation = $"主要按钮指示器/动画"
	NewData.draw_state_animation = $"工具指示器/动画"
	NewData.color_animation = $"../颜料选择/颜料动画"
	
	NewData.color_show = $"绘制工具集合/颜料"
	NewData.block_position = $"../三维世界/节点放置"
	NewData.export_animation = $"../导出/导出动画"
	
	NewData.back_texture = $"../背景图/纹理"
	
	$"版本信息".set_text(ProjectSettings.get_setting("application/config/version"))
	
	for i in $"../颜料选择".get_children():
		if i.name == "颜料动画":
			continue
		NewData.color_array.append(i.get_modulate())

func 绘制按钮按下() -> void:
	NewData.state_change(0)
	pass
func 设置按钮按下() -> void:
	NewData.state_change(1)
	pass
func 导出按钮被按下() -> void:
	NewData.state_change(2)
	pass


func 铅笔按钮() -> void:
	NewData.draw_state_change(0)
	pass


func 橡皮按钮() -> void:
	NewData.draw_state_change(1)
	pass


func 涂料按钮() -> void:
	NewData.draw_state_change(2)
	pass


func 颜料按钮() -> void:
	NewData.draw_state_change(3)
	pass 
