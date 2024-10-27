extends Panel
func _ready() -> void:
	NewData.setting = self
	NewData.set_animation = $"设置动画"

func 灵敏度修改(to_value: float) -> void:
	NewData.rorate_angle = snappedf(5 * to_value, 0.1)
	$"灵敏度调整/数值".text = str(NewData.rorate_angle)
	pass 


func 速度修改(to_value: float) -> void:
	NewData.move_speed = snappedf(50 * to_value, 0.1)
	$"速度调整/数值".text = str(NewData.move_speed)
	pass

func start_set():
	$"灵敏度调整/数值".text = str(NewData.rorate_angle)
	$"速度调整/数值".text = str(NewData.move_speed)
	$"灵敏度调整/滑动条".set_value(NewData.rorate_angle/5)
	$"速度调整/滑动条".set_value(NewData.move_speed/50)


func 导入背景图() -> void:
	$"../文件夹相关/背景图导入".set_visible(true)
	pass 


func 背景图导入路径(path: String) -> void:
	var load_image = Image.load_from_file(path)
	var save_file = save_data.new()
	save_file.back_ground = ImageTexture.create_from_image(load_image)
	
	NewData.back_texture.set_texture(save_file.back_ground)
	
	ResourceSaver.save(save_file,"user://setting.res")
	
	pass


func 重置背景图() -> void:
	var save_file = save_data.new()
	save_file.back_ground = null
	NewData.back_texture.set_texture(save_file.back_ground)
	ResourceSaver.save(save_file,"user://setting.res")
	pass
