extends Node

#0为绘制，1为设置，2为导出
#三状态
var state:int = 0
#状态动画机
var state_animation

#0为铅笔，1为橡皮，2为涂料，3为颜色
#三状态
var draw_state:int = 0
#画笔状态动画机
var draw_state_animation

#颜料动画机
var color_animation
#当前选择的绘制颜色
var draw_color:Color
#用户见到的颜色
var color_show
#用户颜色组合
var color_array:Array

#设置动画
var set_animation

#音乐动画
var music_animation

var is_music_ui:bool = false

#导出动画
var export_animation


var block_position

var draw_list = {}
var block_list = {}

#视图移动速度
@export var move_speed:float = 10
#视图旋转速度
@export var rorate_angle:float = 1

#滑动条
#var sizebar:Array
#func make_sizebar():
	#sizebar[0].make_value(rorate_angle/2)
	#sizebar[1].make_value(move_speed/20)
#

#背景图纹理放置
var back_texture

var setting
#视图组合
var father_node:Array


#三视图刷新
func father_draw():
	if multiplayer.multiplayer_peer !=null:
		self.rpc("server_draw",draw_list)
	for i in father_node:
		i.draw_color()
	
#项目状态转换
func state_change(to_num:int):
	if to_num == state:
		return
	if state == 1:
		set_animation.play_backwards("设置")
	if is_music_ui:
		music_animation.play_backwards("音乐")
		is_music_ui = false
	if to_num == 0:
		#动画调整	
		if state == 1:
			state_animation.play_backwards("绘制到设置")
		else:
			state_animation.play_backwards("绘制到导出")
		#状态调整
		
	elif to_num == 1:
		if draw_state == 3:
			draw_state_change(last_state)
		if state == 0:
			state_animation.play("绘制到设置")
		else:
			state_animation.play_backwards("设置到导出")
		set_animation.play("设置")
	elif to_num == 2:
		if state == 0:
			state_animation.play("绘制到导出")
		else:
			state_animation.play("设置到导出")
		
		NewData.export_animation.play("导出开启")
	if state == 2:
		NewData.export_animation.play_backwards("导出开启")
	state = to_num
	pass
#工具状态转换
var last_state:int
func draw_state_change(to_num:int):
	if to_num == draw_state:
		return
	if is_music_ui:
		music_animation.play_backwards("音乐")
		is_music_ui = false
	if draw_state == 3:
		color_animation.play_backwards("颜料开启")
	if to_num == 0:
		#动画调整	
		if draw_state == 1:
			draw_state_animation.play_backwards("工具动画/铅笔到橡皮")
		elif draw_state == 2:
			draw_state_animation.play_backwards("工具动画/铅笔到涂料")
		else:		
			draw_state_animation.play_backwards("工具动画/铅笔到颜料")
		#状态调整	
	elif to_num == 1:
		if draw_state == 0:
			draw_state_animation.play("工具动画/铅笔到橡皮")
		elif draw_state == 2:
			draw_state_animation.play_backwards("工具动画/橡皮到涂料")
		else:		
			draw_state_animation.play_backwards("工具动画/橡皮到颜料")
	elif to_num == 2:
		if draw_state == 0:
			draw_state_animation.play("工具动画/铅笔到涂料")
		elif draw_state == 1:
			draw_state_animation.play("工具动画/橡皮到涂料")
		else:		
			draw_state_animation.play("工具动画/颜料到涂料")		
	else:
		if state == 1:
			return
		if draw_state == 0:
			draw_state_animation.play("工具动画/铅笔到颜料")
			last_state = 0
		elif draw_state == 1:
			draw_state_animation.play("工具动画/橡皮到颜料")
			last_state = 1
		else:		
			draw_state_animation.play_backwards("工具动画/颜料到涂料")
			last_state = 2
		color_animation.play("颜料开启")

	draw_state = to_num	
	pass

func make_set():
	setting.start_set()


const block = preload("res://预制体/网格.tscn")

@rpc("any_peer","call_remote","unreliable")
func server_draw(d_s):			
	draw_list = d_s
	father_rpcdraw()


	block_list.clear()
	for i in block_position.get_children():
		i.queue_free()
		pass
	for i in draw_list:
		make_block(i,NewData.draw_list.get(i))
		pass
	
	pass

func make_block(make_position:Vector3,make_color:Color):
	var temp_block = block.instantiate()
	block_position.add_child(temp_block)
	temp_block.set_position(make_position)
	temp_block.make_color(make_color)
	block_list[make_position] = temp_block 	
	pass
	
func father_rpcdraw():
	for i in father_node:
		i.draw_color()
