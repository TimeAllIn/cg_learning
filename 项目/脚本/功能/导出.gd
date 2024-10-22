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
#vt 0.375000 0.000000
#vt 0.625000 0.000000
#vt 0.625000 0.250000
#vt 0.375000 0.250000
#vt 0.625000 0.500000
#vt 0.375000 0.500000
#vt 0.625000 0.750000
#vt 0.375000 0.750000
#vt 0.875000 0.750000
#vt 0.125000 0.750000
#vt 0.125000 0.500000
#vt 0.875000 0.500000\n"

@export var num_array:Array
@export var block_size:float = 0.5

var load_path:String

var mtl_string:= "newmtl palette
illum 1
Ka 0.000 0.000 0.000
Kd 1.000 1.000 1.000
Ks 0.000 0.000 0.000
map_Kd"

func _on_按钮_pressed() -> void:
	if Data.block_list.is_empty():
		
		return	
	$"../../../文件保存框".set_visible(true)

func objstring():
	var return_string:String = "#课程设计软件制作，请勿商用" + "\n"
	return_string += "mtllib"+" "+name_tag+".mtl" + "\n"	
	return_string += "o" + name_tag + "\n"
	
	var num := 0
	for i in Data.block_list:
		for t in num_array:
			var temp_position:= Vector3(i.z,i.x,i.y)  * block_size
			var temp = temp_position + t *(block_size /2)
			return_string += "v"+" "+str(temp.x)+" "+str(temp.y)+" "+str(temp.z)+"\n"
	return_string += string_all	
	
	
	
	return_string += "s 0\n"
	
	for i in Data.draw_list:	
		var temp_num:int
		for color_num in range(Data.color_array.size()):		
			print(color_num)
			print(Data.draw_list.get(i))
			print(Data.color_array[color_num])
			
			if Data.draw_list.get(i) == Data.color_array[color_num]:
				temp_num = color_num + 1
				
				print("ok")
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

func _on_文件保存框_file_selected(path: String) -> void:
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
		var error = image.save_png(fail_path + ".png")
		
	load_path = ""
	pass 
