extends GridContainer
class_name draw_show
@export var look:int = 0
@export var layer:int = 0

func _ready() -> void:
	Data.fater_node.append(self)
	for i in range(get_child_count()):
		get_child(i).id = i
		get_child(i).father_node = self
	pass

func find_position(id:int):
	var h = id / 10
	var l = id % 10
	if look == 0:				
		return Vector3(l, 9 - h ,9 - layer)
	elif look == 1:		
		return Vector3(9 - layer, 9 - h ,9 - l)
	elif look == 2:		
		return Vector3(l, 9 - layer ,h)
	pass

func draw_color():
	for i in range(get_child_count()):
		var id = get_child(i).id
		var h = id / 10
		var l = id % 10
		if look == 0:				
			if Data.draw_list.has(Vector3(l, 9 - h ,9 - layer)):
				get_child(i).draw_color(Data.draw_list.get(Vector3(l, 9 - h ,9 - layer)))
			else:
				get_child(i).draw_color(Color(0,0,0,0))
		elif look == 1:		
			if Data.draw_list.has(Vector3(9 - layer, 9 - h ,9 - l)):
				get_child(i).draw_color(Data.draw_list.get(Vector3(9 - layer, 9 - h ,9 - l)))
			else:
				get_child(i).draw_color(Color(0,0,0,0))		
		elif look == 2:		
			if Data.draw_list.has(Vector3(l, 9 - layer ,h)):
				get_child(i).draw_color(Data.draw_list.get(Vector3(l, 9 - layer ,h)))
			else:
				get_child(i).draw_color(Color(0,0,0,0))
			
	
	pass
