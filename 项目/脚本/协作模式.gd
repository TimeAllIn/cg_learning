extends Panel

#网络状态，0个人，1服务端，2客户端
@export var net_state:int
@onready var animation: AnimationPlayer = $"标题/协作模式/选择动画"

func change_state(change_num:int):
	if net_state == change_num:
		return
	if net_state == 0 :
		if change_num == 1:
			animation.play("个人到服务")
		elif change_num == 2:
			animation.play("个人到客户")
	elif net_state == 1 :
		if change_num == 0:
			animation.play_backwards("个人到服务")
		elif change_num == 2:
			animation.play("服务到客户")
	elif net_state == 2 :
		if change_num == 0:
			animation.play_backwards("个人到客户")
		elif change_num == 1:
			animation.play_backwards("服务到客户")
	net_state = change_num

@export var no_color:Color
@export var server_color:Color

func _ready() -> void:
	NewData.server_icon = self

func 单人模式() -> void:
	change_state(0)
	$"标题/个人".set_visible(true)
	$"标题/服务端".set_visible(false)
	$"标题/客户端".set_visible(false)
	pass


func 服务端() -> void:
	change_state(1)
	$"标题/个人".set_visible(false)
	$"标题/服务端".set_visible(true)
	$"标题/客户端".set_visible(false)
	pass


func 客户端() -> void:
	change_state(2)
	$"标题/个人".set_visible(false)
	$"标题/服务端".set_visible(false)
	$"标题/客户端".set_visible(true)
	pass


func 开启服务器() -> void:
	var peer = ENetMultiplayerPeer.new()
	if peer.create_server(int($"标题/服务端/端口/输入框".get_text())) == OK:
		print("创建服务器")
		NewData.multiplayer.multiplayer_peer = peer
		$"颜色指示符".set_modulate(server_color)
	else:
		$"颜色指示符".set_modulate(no_color)
		print("创建服务器失败")
	pass


func 连接服务器() -> void:
	var peer = ENetMultiplayerPeer.new()
	if peer.create_client($"标题/客户端/IP/输入框".get_text(),int($"标题/客户端/端口/输入框".get_text())) == OK:
		print("连接服务器")
		NewData.multiplayer.multiplayer_peer = peer	
		$"颜色指示符".set_modulate(server_color)
	else:
		$"颜色指示符".set_modulate(no_color)
		print("连接服务器失败")
	pass # Replace with function body.


func 断开连接() -> void:
	if NewData.multiplayer.multiplayer_peer != null:
		NewData.rpc("destory_server")
	NewData.multiplayer.multiplayer_peer = null
	$"颜色指示符".set_modulate(no_color)
	pass # Replace with function body.
