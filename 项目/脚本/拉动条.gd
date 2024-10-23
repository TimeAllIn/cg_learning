extends Control


var mouse_in:bool
var is_mouse:bool

signal get_mouse_in(value:float)

func 鼠标进入() -> void:
	if Input.is_action_pressed("mouse_left"):
		return
	mouse_in = true
	pass 


func 鼠标离开() -> void:
	mouse_in = false
	pass 

var last_mouse:Vector2
var now_mouse:Vector2

var canMove:float
func _ready() -> void:
	canMove = $"拉动手柄".position.x
	Data.sizebar.append(self)

func _physics_process(delta: float) -> void:
	if mouse_in or is_mouse:
		emit_signal("get_mouse_in",value)
		if Input.is_action_just_pressed("mouse_right"):
			$"拉动手柄".position.x = canMove
		is_mouse = Input.is_action_pressed("mouse_left")
		if Input.is_action_just_pressed("mouse_left"):
			last_mouse = get_viewport().get_mouse_position()
			now_mouse = last_mouse
		if is_mouse:
			now_mouse = get_viewport().get_mouse_position()
			if last_mouse.x != now_mouse.x:
				$"拉动手柄".position.x += now_mouse.x - last_mouse.x
				last_mouse = now_mouse		
			pass	
	math_position()
	value = $"拉动手柄".position.x/(canMove * 2)
func math_position():
	if $"拉动手柄".position.x < 0:
		$"拉动手柄".position.x = 0
	elif $"拉动手柄".position.x > (canMove * 2):
		$"拉动手柄".position.x = (canMove * 2)
	pass
@export var value:float
func return_value():
	return value

@export var id:int

func make_value(set_value:float = 0.5):
	$"拉动手柄".position.x = (canMove * 2) * set_value
	if id == 0:
		$"../数值".text = str(Data.rorate_angle)
	elif id == 1:
		$"../../移动速度/数值".text = str(Data.move_speed)
