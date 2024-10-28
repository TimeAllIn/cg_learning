extends Panel
@export var name_tag:String
var string_all:String ="vn -1.0000 -0.0000 -0.0000
vn -0.0000 -0.0000 -1.0000
vn 1.0000 -0.0000 -0.0000
vn -0.0000 -0.0000 1.0000
vn -0.0000 -1.0000 -0.0000
vn -0.0000 1.0000 -0.0000

vt 0.05 0.5
vt 0.15 0.5
vt 0.25 0.5
vt 0.35 0.5
vt 0.45 0.5
vt 0.55 0.5
vt 0.65 0.5
vt 0.75 0.5
vt 0.85 0.5
vt 0.95 0.5
\n"
@export var num_array:Array
@export var block_size:float = 0.5
var load_path:String
var mtl_string:= "newmtl palette
illum 1
Ka 0.000 0.000 0.000
Kd 1.000 1.000 1.000
Ks 0.000 0.000 0.000
map_Kd"

func objstring():
	var return_string:String = "#课程设计软件制作" + "\n"
	return_string += "mtllib"+" "+name_tag+".mtl" + "\n"	
	return_string += "o " + name_tag + "\n"	
	var num := 0	
	for i in NewData.block_list:
		for t in num_array:
			var temp_position:= Vector3(i.z,i.x,i.y)  * block_size
			var temp = temp_position + t *(block_size /2)
			return_string += "v"+" "+str(temp.x)+" "+str(temp.y)+" "+str(temp.z)+"\n"
	return_string += string_all		
	return_string += "s 0\n"
	
	for i in NewData.draw_list:	
		var temp_num:int
		for color_num in range(NewData.color_array.size()):		

			print(NewData.draw_list.get(i))
			print(NewData.color_array[color_num])
			
			if NewData.draw_list.get(i) == NewData.color_array[color_num]:
				temp_num = color_num + 1

				break
			pass
		return_string += "f"+" "+str(num * 8 +1) +"/"+str(temp_num)+"/1" +" "
		return_string += str(num * 8 +2) +"/"+str(temp_num)+"/1" +" "
		return_string += str(num * 8 +4) +"/"+str(temp_num)+"/1" +" "
		return_string += str(num * 8 +3) +"/"+str(temp_num)+"/1" +"\n"
		
		return_string += "f"+" "+str(num * 8 +3) +"/"+str(temp_num)+"/2" +" "
		return_string += str(num * 8 +4) +"/"+str(temp_num)+"/2" +" "
		return_string += str(num * 8 +8) +"/"+str(temp_num)+"/2" +" "
		return_string += str(num * 8 +7) +"/"+str(temp_num)+"/2" +"\n"
		
		
		return_string += "f"+" "+str(num * 8 +7) +"/"+str(temp_num)+"/3" +" "
		return_string += str(num * 8 +8) +"/"+str(temp_num)+"/3" +" "
		return_string += str(num * 8 +6) +"/"+str(temp_num)+"/3" +" "
		return_string += str(num * 8 +5) +"/"+str(temp_num)+"/3" +"\n"
		
		return_string += "f"+" "+str(num * 8 +2) +"/"+str(temp_num)+"/4" +" "
		return_string += str(num * 8 +1) +"/"+str(temp_num)+"/4" +" "
		return_string += str(num * 8 +5) +"/"+str(temp_num)+"/4" +" "
		return_string += str(num * 8 +6) +"/"+str(temp_num)+"/4" +"\n"
		
		return_string += "f"+" "+str(num * 8 +3) +"/"+str(temp_num)+"/5" +" "
		return_string += str(num * 8 +7) +"/"+str(temp_num)+"/5" +" "
		return_string += str(num * 8 +5) +"/"+str(temp_num)+"/5" +" "
		return_string += str(num * 8 +1) +"/"+str(temp_num)+"/5" +"\n"
		
		return_string += "f"+" "+str(num * 8 +8) +"/"+str(temp_num)+"/6" +" "
		return_string += str(num * 8 +4) +"/"+str(temp_num)+"/6" +" "
		return_string += str(num * 8 +2) +"/"+str(temp_num)+"/6" +" "
		return_string += str(num * 8 +6) +"/"+str(temp_num)+"/6" +"\n"
		
		num += 1
	
	return return_string

func OBJ文件保存(path: String) -> void:
	load_path = path
	if load_path == "":
		return
	else:
		var fail_name = load_path.get_file() # file 为 ".....obj"
		var fail_path = load_path.get_basename() # base 为 "/path/to/file"
		
		
		var tint = fail_name.findn(".obj")
		name_tag = fail_name.erase(tint,4)

		
		var file_obj = FileAccess.open(fail_path + ".obj", FileAccess.WRITE)
		file_obj.store_string(objstring())
		
		
		var file_mtl = FileAccess.open(fail_path + ".mtl", FileAccess.WRITE)
		file_mtl.store_string(mtl_string +" "+name_tag + ".png")
		
		var texture = load("res://素材/颜料表.png")
		var image: Image = texture.get_image()
		image.save_png(fail_path + ".png")
		

	pass 

func 加载() -> void:
	$"../文件夹相关/存档读取".set_visible(true)
	pass

func 保存() -> void:
	if NewData.block_list.is_empty():
		return
	$"../文件夹相关/存档加载".set_visible(true)
	pass

func 导出() -> void:
	if NewData.block_list.is_empty():		
		return	
	$"../文件夹相关/文件保存框".set_visible(true)
	pass

func 存档(path: String) -> void:
	
	var config = ConfigFile.new()
	config.set_value("课程设计数据存储","颜色信息",NewData.draw_list)

	config.set_value("课程设计数据存储","摄像机坐标",%"摄像机".position)
	config.set_value("课程设计数据存储","摄像机旋转",%"摄像机".get_rotation())
	
	config.set_value("课程设计数据存储","灵敏度",NewData.rorate_angle)
	config.set_value("课程设计数据存储","移动速度",NewData.move_speed)
	NewData.load_path = path
	config.save(path)
	pass


const block = preload("res://预制体/网格.tscn")
func 读档(path: String) -> void:
	var config = ConfigFile.new()
	if config.load(path) != OK:
		return

	if not config.has_section("课程设计数据存储"):
		return
	if config.has_section_key("课程设计数据存储","颜色信息"):
		NewData.draw_list = config.get_value("课程设计数据存储","颜色信息")
		NewData.load_path = path
	if config.has_section_key("课程设计数据存储","摄像机坐标"):
		%"摄像机".position = config.get_value("课程设计数据存储","摄像机坐标")
	if config.has_section_key("课程设计数据存储","摄像机旋转"):
		%"摄像机".set_rotation(config.get_value("课程设计数据存储","摄像机旋转"))
	if config.has_section_key("课程设计数据存储","灵敏度"):
		NewData.rorate_angle = config.get_value("课程设计数据存储","灵敏度")
	if config.has_section_key("课程设计数据存储","移动速度"):
		NewData.move_speed = config.get_value("课程设计数据存储","移动速度")
	
	NewData.make_set()
	NewData.father_draw()
	NewData.block_list.clear()
	for i in NewData.block_position.get_children():
		i.queue_free()
		pass
	for i in NewData.draw_list:
		make_block(i,NewData.draw_list.get(i))
		pass
	NewData.state_change(0)
	pass 
func make_block(make_position:Vector3,draw_color:Color):
	var temp_block = block.instantiate()
	NewData.block_position.add_child(temp_block)
	temp_block.set_position(make_position)
	temp_block.make_color(draw_color)
	NewData.block_list[make_position] = temp_block 	
	pass
