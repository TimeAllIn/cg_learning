extends MeshInstance3D

func destory():
	queue_free()
func make_color(color:Color):
	get_material_override().set_albedo(color)

func is_color(toColor:Color):
	return get_material_override().get_albedo() == toColor
		
