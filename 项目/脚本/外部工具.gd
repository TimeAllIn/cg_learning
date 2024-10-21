extends Control

@export var father_node:draw_show


func _on_操作_pressed() -> void:
	father_node.layer -= 1
	if father_node.layer < 0:
		father_node.layer = 9
	$"层数编辑/文本编辑".set_placeholder(str(father_node.layer))

	father_node.draw_color()
	pass


func _on_操作add_pressed() -> void:
	father_node.layer += 1
	if father_node.layer > 9:
		father_node.layer = 0
	
	$"层数编辑/文本编辑".set_placeholder(str(father_node.layer))
	father_node.draw_color()
	pass 
