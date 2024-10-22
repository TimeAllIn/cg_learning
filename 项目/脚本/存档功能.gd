extends Panel

#在程序唤醒的第一帧运行，且只运行一次
func _ready() -> void:
	pass
var config
func 存档() -> void:
	if Data.block_list.is_empty():
		return
	config = ConfigFile.new()
	config.set_value("课程设计数据存储","颜色信息",Data.draw_list)
	$"../../存档加载".set_visible(true)
	pass



func 存档路径(path: String) -> void:
	config.save(path)
	pass


func 读取() -> void:
	config = ConfigFile.new()
	$"../../存档读取".set_visible(true)
	pass 


const block = preload("res://预制体/网格.tscn")
func 读取路径(path: String) -> void:
	config.load(path)
	Data.draw_list = config.get_value("课程设计数据存储","颜色信息")
	Data.father_draw()
	for i in Data.draw_list:
		make_block(i,Data.draw_list.get(i))
		pass
	
	pass 

func make_block(make_position:Vector3,draw_color:Color):
	var temp_block = block.instantiate()
	Data.block_position.add_child(temp_block)
	temp_block.set_position(make_position)
	temp_block.make_color(draw_color)
	Data.block_list[make_position] = temp_block 	
	pass
