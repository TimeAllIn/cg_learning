extends MeshInstance3D

func destory():
	queue_free()
func make_color(color:Color):
	get_material_override().set_albedo(color)
