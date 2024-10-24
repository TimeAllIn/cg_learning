extends CharacterBody3D


@export var move_speed:float = 5
@export var jump_tall:float = 5



func _ready() -> void:
	$"摄像机/摄像机".set_current(true)
	Input.set_mouse_mode(2)


#玩家可以跳跃的次数，可以设置几连跳
@export var jumpNum:int = 1
#玩家被允许跳跃的次数，无需更改
var canJump:int = 0

#获取重力加速度
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

#固定帧率运行，默认每秒60次，如需修改进入项目设置
func _physics_process(delta):
	
	#添加重力
	#not is_on_floor()指玩家在空中
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		canJump = jumpNum

	#跳跃设置
	if Input.is_action_just_pressed("jump") and canJump > 0:
		canJump -= 1
		velocity.y = jump_tall

	var add_ment=Vector2(Input.get_axis("w","s"),Input.get_axis("a","d"))
	var forward = $"旋转轴".to_global($"旋转轴/forward".position).direction_to(position)
	var right = $"旋转轴".to_global($"旋转轴/right".position).direction_to(position)

	var move_ment = (forward * add_ment.x - right * add_ment.y)
	
	#水平移动
	#var input_dir = Input.get_vector("a", "d", "w", "s")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#print(input_dir)
	
	
	if move_ment != Vector3(0,0,0):
		velocity.x = move_ment.x * move_speed
		velocity.z = move_ment.z *move_speed
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)
		velocity.z = move_toward(velocity.z, 0, move_speed)

	move_and_slide()
	alldelta = delta

var look_screen:Control
var color:Color
func start():
	look_screen.gui_input.connect(连接)
	$"网格".get_material_override().set_albedo(color)
	$"网格".get_material_override().set_emission(color)

var now_mouse:Vector2
@export var rotate_speed:float = 2

var alldelta:float
func 连接(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouse_motion = event as InputEventMouseMotion
		now_mouse = mouse_motion.get_screen_relative()
		if now_mouse != Vector2(0,0):
			$"摄像机".set_rotation_degrees($"摄像机".get_rotation_degrees() + (Vector3(-now_mouse.y,- now_mouse.x,0) * rotate_speed * alldelta))
			if $"摄像机".get_rotation_degrees().x < -50:
				$"摄像机".rotation_degrees.x = -50		
			elif $"摄像机".get_rotation_degrees().x > -10:
				$"摄像机".rotation_degrees.x = -10
			$"旋转轴".rotation_degrees.y = $"摄像机".rotation_degrees.y
		pass
	pass # Replace with function body.
