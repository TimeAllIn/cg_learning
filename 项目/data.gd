#class_name data 
extends Node

@export var draw:bool = true

@export var eraser:bool = false

@export var painter:bool = false

@export var draw_color:Color

var fater_node:Array

var block_position

var draw_list = {}
var block_list = {}

var select_color:= Color(0,100,100,255)
var not_select_color:Color = Color(208,100,100,255)
var button_array:Array

var color_show

func father_draw():
	for i in fater_node:
		i.draw_color()

func change_color(color:Color):
	draw_color = color
	color_show.set_modulate(color)
	
@export var move_speed:float = 10
@export var rorate_angle:float = 1
