extends Panel
@export var name_tag:String

var string_all:String ="vn -1.0000 -0.0000 -0.0000
vn -0.0000 -0.0000 -1.0000
vn 1.0000 -0.0000 -0.0000
vn -0.0000 -0.0000 1.0000
vn -0.0000 -1.0000 -0.0000
vn -0.0000 1.0000 -0.0000
vt 0.375000 0.000000
vt 0.625000 0.000000
vt 0.625000 0.250000
vt 0.375000 0.250000
vt 0.625000 0.500000
vt 0.375000 0.500000
vt 0.625000 0.750000
vt 0.375000 0.750000
vt 0.875000 0.750000
vt 0.125000 0.750000
vt 0.125000 0.500000
vt 0.875000 0.500000\n"

@export var num_array:Array
@export var block_size:float = 0.5
func _on_按钮_pressed() -> void:
	if Data.block_list.size() <= 0:
		return	
	var file = FileAccess.open("user://"+$"../文件名称".get_text()+".obj", FileAccess.WRITE)
	file.store_string(objstring())





func objstring():
	var return_string:String = "#课程设计软件制作，请勿商用" + "\n"
	return_string += "o"+" "+$"../文件名称".get_text() + "\n"
	var num := 0
	for i in Data.block_list:
		for t in num_array:
			var temp_position:= Vector3(i.z,i.x,i.y)  * block_size
			var temp = temp_position + t *(block_size /2)
			return_string += "v"+" "+str(temp.x)+" "+str(temp.y)+" "+str(temp.z)+"\n"
	return_string += string_all	
	return_string += "s 0\n"
	for i in Data.block_list:	
		return_string += "f"+" "+str(num * 8 +1) +"/1/1" +" "
		return_string += str(num * 8 +2) +"/2/1" +" "
		return_string += str(num * 8 +4) +"/3/1" +" "
		return_string += str(num * 8 +3) +"/4/1" +"\n"
		
		return_string += "f"+" "+str(num * 8 +3) +"/4/2" +" "
		return_string += str(num * 8 +4) +"/3/2" +" "
		return_string += str(num * 8 +8) +"/5/2" +" "
		return_string += str(num * 8 +7) +"/6/2" +"\n"
		
		
		return_string += "f"+" "+str(num * 8 +7) +"/6/3" +" "
		return_string += str(num * 8 +8) +"/5/3" +" "
		return_string += str(num * 8 +6) +"/7/3" +" "
		return_string += str(num * 8 +5) +"/8/3" +"\n"
		
		return_string += "f"+" "+str(num * 8 +2) +"/9/4" +" "
		return_string += str(num * 8 +1) +"/10/4" +" "
		return_string += str(num * 8 +5) +"/8/4" +" "
		return_string += str(num * 8 +6) +"/7/4" +"\n"
		
		return_string += "f"+" "+str(num * 8 +3) +"/11/5" +" "
		return_string += str(num * 8 +7) +"/6/5" +" "
		return_string += str(num * 8 +5) +"/8/5" +" "
		return_string += str(num * 8 +1) +"/10/5" +"\n"
		
		return_string += "f"+" "+str(num * 8 +8) +"/5/6" +" "
		return_string += str(num * 8 +4) +"/12/6" +" "
		return_string += str(num * 8 +2) +"/9/6" +" "
		return_string += str(num * 8 +6) +"/7/6" +"\n"
		
		num += 1
	
	return return_string
