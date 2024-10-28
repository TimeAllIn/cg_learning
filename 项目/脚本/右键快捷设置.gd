extends Panel
@onready var animation: AnimationPlayer = $"动画播放器"

func state_change(id:int):
	if NewData.right_state == id:
		return
	if NewData.right_state == 0:
		if id == 1:
			animation.play("不启用到铅笔")
		elif id == 2:
			animation.play("不启用到橡皮")
		elif id == 3:
			animation.play("不启用到涂料")
	elif NewData.right_state == 1:
		if id == 0:
			animation.play_backwards("不启用到铅笔")
		elif id == 2:
			animation.play("铅笔到橡皮")
		elif id == 3:
			animation.play("铅笔到涂料")
	elif NewData.right_state == 2:
		if id == 0:
			animation.play_backwards("不启用到橡皮")
		elif id == 1:
			animation.play_backwards("铅笔到橡皮")
		elif id == 3:
			animation.play("橡皮到涂料")
	elif NewData.right_state == 3:
		if id == 0:
			animation.play_backwards("不启用到涂料")
		elif id == 1:
			animation.play_backwards("铅笔到涂料")
		elif id == 2:
			animation.play_backwards("橡皮到涂料")
	NewData.right_state = id
	pass


func 不启用() -> void:
	state_change(0)
	pass

func 铅笔() -> void:
	state_change(1)
	pass


func 橡皮() -> void:
	state_change(2)
	pass


func 涂料() -> void:
	state_change(3)
	pass
