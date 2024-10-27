extends Control

var is_mouse_in:bool
func 鼠标进入() -> void:
	is_mouse_in = true
	pass

func 鼠标离开() -> void:
	is_mouse_in = false
	pass

var max_value
@export var value:float
var start_value
func _ready() -> void:
	max_value = $"容器".position.x * 2
	start_value = value
	set_value()

var is_mouse:bool
var now_mouse:Vector2
var last_mouse:Vector2

signal value_change(to_value:float)

func _physics_process(delta: float) -> void:
	if is_mouse_in or is_mouse:
		if Input.is_action_just_pressed("mouse_right"):
			$"容器".position.x = max_value * start_value
		is_mouse = Input.is_action_pressed("mouse_left")
		if Input.is_action_just_pressed("mouse_left"):
			last_mouse = get_viewport().get_mouse_position()
			now_mouse = last_mouse
		if is_mouse:
			now_mouse = get_viewport().get_mouse_position()
			if last_mouse.x != now_mouse.x:
				$"容器".position.x += now_mouse.x - last_mouse.x
				last_mouse = now_mouse
			emit_signal("value_change",value)
		value = $"容器".position.x/max_value
		math_value()
		
		pass

func set_value(to_value:float = -10):
	if to_value >= 0:
		if to_value >= 1:
			value = 1
		else:
			value = to_value
	$"容器".position.x = value * max_value

func math_value():
	if value < 0:
		value = 0
	elif value > 1:
		value = 1
	set_value()
	
