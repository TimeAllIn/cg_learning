extends Control

@export var a_color:Color
@export var b_color:Color



func _ready() -> void:
	Data.block_position = $"../三维世界/节点放置"
	Data.select_color = a_color
	Data.not_select_color = b_color
	Data.color_show = $"../画面/工具/工具/当前颜色"
	Data.back_ground = $"../背景图片/贴图纹理"

	
#窗口的移动
var dragging:bool #拖拽状态
var v2_mouse:Vector2i #鼠标的偏差
func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			dragging = true
			v2_mouse = get_global_mouse_position()
		else:
			dragging = false
	if event is InputEventMouseMotion and dragging:
	#窗口位置=鼠标位置 - 鼠标的偏差值
		DisplayServer.window_set_position(DisplayServer.mouse_get_position()-v2_mouse)

func _on_关闭_pressed() -> void:
	get_tree().quit()
	pass
