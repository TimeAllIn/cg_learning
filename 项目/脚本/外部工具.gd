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



func _on_正视角_button_pressed() -> void:
	$"容器".move_child($"容器/正视角",0)
	father_node.look = 0
	father_node.draw_color()
	pass # Replace with function body.


func _on_侧视角_button_pressed() -> void:
	$"容器".move_child($"容器/侧视角",0)
	father_node.look = 1
	father_node.draw_color()
	pass # Replace with function body.
	



func _on_俯视角_button_pressed() -> void:
	$"容器".move_child($"容器/俯视角",0)
	father_node.look = 2
	father_node.draw_color()
	pass # Replace with function body.
