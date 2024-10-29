extends Panel
@export var name_tag:String
@export var num_array:Array
@export var block_size:float = 0.5
var load_path:String
var mtl_string:= "newmtl palette
illum 1
Ka 0.000 0.000 0.000
Kd 1.000 1.000 1.000
Ks 0.000 0.000 0.000
map_Kd"

var color_array:Array

func objstring():
	var string_name:String =  "#课程设计软件制作" + "\n"
	string_name += "mtllib"+" "+name_tag+".mtl" + "\n"	
	string_name += "o " + name_tag + "\n"	
	
	var string_v:String

	for i in NewData.block_list:
		for t in num_array:
			var temp_position:= Vector3(i.z,i.x,i.y)  * block_size
			var temp = temp_position + t *(block_size /2)
			string_v += "v"+" "+str(temp.x)+" "+str(temp.y)+" "+str(temp.z)+"\n"
	var string_vn:String = "vn -1.0000 -0.0000 -0.0000
vn -0.0000 -0.0000 -1.0000
vn 1.0000 -0.0000 -0.0000
vn -0.0000 -0.0000 1.0000
vn -0.0000 -1.0000 -0.0000
vn -0.0000 1.0000 -0.0000\n"

	var string_vt:String
	color_array.clear()
	for i in NewData.draw_list:
		if not color_array.has(NewData.draw_list.get(i)):
			color_array.append(NewData.draw_list.get(i))
	var color_all_num = color_array.size()		
	for i in range(color_all_num):
		string_vt += "vt" +" " + str(float(i)/float(color_all_num)+ float(1)/ float(color_all_num *2))+" " +"0.5\n"
	var string_f:String	= "s 0\n"
	var num := 0	
	for i in NewData.draw_list:	
		var temp_num:int = 0
		for color_num in range(color_all_num):
			if NewData.draw_list.get(i) == color_array[color_num]:
				temp_num = color_num + 1			
				break
			pass
		string_f += "f"+" "+str(num * 8 +1) +"/"+str(temp_num)+"/1" +" "
		string_f += str(num * 8 +2) +"/"+str(temp_num)+"/1" +" "
		string_f += str(num * 8 +4) +"/"+str(temp_num)+"/1" +" "
		string_f += str(num * 8 +3) +"/"+str(temp_num)+"/1" +"\n"
		
		string_f += "f"+" "+str(num * 8 +3) +"/"+str(temp_num)+"/2" +" "
		string_f += str(num * 8 +4) +"/"+str(temp_num)+"/2" +" "
		string_f += str(num * 8 +8) +"/"+str(temp_num)+"/2" +" "
		string_f += str(num * 8 +7) +"/"+str(temp_num)+"/2" +"\n"
		
		
		string_f += "f"+" "+str(num * 8 +7) +"/"+str(temp_num)+"/3" +" "
		string_f += str(num * 8 +8) +"/"+str(temp_num)+"/3" +" "
		string_f += str(num * 8 +6) +"/"+str(temp_num)+"/3" +" "
		string_f += str(num * 8 +5) +"/"+str(temp_num)+"/3" +"\n"
		
		string_f += "f"+" "+str(num * 8 +2) +"/"+str(temp_num)+"/4" +" "
		string_f += str(num * 8 +1) +"/"+str(temp_num)+"/4" +" "
		string_f += str(num * 8 +5) +"/"+str(temp_num)+"/4" +" "
		string_f += str(num * 8 +6) +"/"+str(temp_num)+"/4" +"\n"
		
		string_f += "f"+" "+str(num * 8 +3) +"/"+str(temp_num)+"/5" +" "
		string_f += str(num * 8 +7) +"/"+str(temp_num)+"/5" +" "
		string_f += str(num * 8 +5) +"/"+str(temp_num)+"/5" +" "
		string_f += str(num * 8 +1) +"/"+str(temp_num)+"/5" +"\n"
		
		string_f += "f"+" "+str(num * 8 +8) +"/"+str(temp_num)+"/6" +" "
		string_f += str(num * 8 +4) +"/"+str(temp_num)+"/6" +" "
		string_f += str(num * 8 +2) +"/"+str(temp_num)+"/6" +" "
		string_f += str(num * 8 +6) +"/"+str(temp_num)+"/6" +"\n"
		
		num += 1
	
	return string_name +string_v + string_vn + string_vt + string_f 

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
		

		var new_image = Image.create(color_array.size(), 1, false, Image.FORMAT_RGBA8)
		for i in range(color_array.size()):
			new_image.set_pixel(i,0,color_array[i])
		new_image.save_png(fail_path + ".png")
		

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
	
	var color_to_save ={}
	for i in $"../颜料选择/颜料板/容器".get_children():
		color_to_save[i.color_vector] = i.to_color
		pass
	config.set_value("课程设计数据存储","色盘",color_to_save)
	
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
	if config.has_section_key("课程设计数据存储","色盘"):		
		var color_to_load = config.get_value("课程设计数据存储","色盘")
		var start_num:int = 0
		for i in color_to_load:
			$"../颜料选择/颜料板/容器".get_child(start_num).color_vector = i
			$"../颜料选择/颜料板/容器".get_child(start_num).set_modulate(color_to_load.get(i))
			$"../颜料选择/颜料板/容器".get_child(start_num).to_color = color_to_load.get(i)
			start_num += 1
			print(start_num)
		pass
		
		
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
