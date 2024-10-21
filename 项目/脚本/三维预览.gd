extends TextureRect

var mouse_in:bool = false

var mouse_right_down:bool = false




func _on_mouse_entered() -> void:
	mouse_in = true	
	pass

func _on_mouse_exited() -> void:
	mouse_in = false
	pass
var last_right:Vector2
var now_right:Vector2	

func _physics_process(delta: float) -> void:
	if mouse_in or mouse_right_down:
		if Input.is_action_just_pressed("mouse_right"):
			last_right = get_viewport().get_mouse_position()
			now_right = last_right
		mouse_right_down = Input.is_action_pressed("mouse_right")
		if mouse_right_down:
			var child_forward = (%"摄像机".to_global(%"摄像机".get_child(0).get_position())).direction_to(%"摄像机".get_position())
			var child_right = (%"摄像机".to_global(%"摄像机".get_child(1).get_position())).direction_to(%"摄像机".get_position())
			var add_ment=Vector2(Input.get_axis("w","s"),Input.get_axis("a","d"))
		
			var move_ment = (child_forward * add_ment.x - child_right * add_ment.y)
			
			%"摄像机".set_position(%"摄像机".get_position() + move_ment*Data.move_speed * delta)
			
			now_right = get_viewport().get_mouse_position()
			if now_right != last_right:
				var rotate_ment = Vector3(last_right.y - now_right.y,last_right.x - now_right.x,0)
				%"摄像机".set_rotation(%"摄像机".get_rotation() + rotate_ment * Data.rorate_angle * delta * 0.1)
				last_right = now_right
				
				pass
		
			
		pass
