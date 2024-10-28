extends Control

var id:int = 0

func _ready() -> void:
	NewData.close_tip = self

func to_load():
	if NewData.load_path.is_relative_path():
		$"../../导出".保存()
	else:
		$"../../导出".存档(NewData.load_path)	
	if id == 0:	
		get_tree().quit()	
	else:		
		pass

func 确认保存() -> void:
	to_load()
	pass


func 确认取消() -> void:
	set_visible(false)
	pass


func 确认退出() -> void:
	if id == 0:
		get_tree().quit()
	else:
		pass
	pass 
