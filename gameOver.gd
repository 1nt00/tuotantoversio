extends CanvasLayer


func _ready():
	pass

func _on_retryButton_gui_input(event):
	var style1 = StyleBoxFlat.new()
	style1.set_bg_color(Color("#8c8c8c"))
	style1.set_corner_radius_all(30)
	style1.set_border_width_all(20)
	style1.set_border_color(Color("292929"))
	$Panel/retryButton/.set('custom_styles/panel', style1)
	
	
	if Input.is_action_pressed("Click"):
		get_tree().change_scene("res://Level1.tscn")





func _on_quitButton_gui_input(event):
	
	var style1 = StyleBoxFlat.new()
	style1.set_bg_color(Color("#a8727d"))
	style1.set_corner_radius_all(30)
	style1.set_border_width_all(20)
	style1.set_border_color(Color("292929"))
	$Panel/quitButton/.set('custom_styles/panel', style1)
	if Input.is_action_pressed("Click"):
		get_tree().quit()
	

func _on_menuButton_gui_input(event):
	
	var style1 = StyleBoxFlat.new()
	style1.set_bg_color(Color("#79a872"))
	style1.set_corner_radius_all(30)
	style1.set_border_width_all(20)
	style1.set_border_color(Color("292929"))
	$Panel/menuButton/.set('custom_styles/panel', style1)
	if Input.is_action_pressed("Click"):
		get_tree().change_scene("res://Menu.tscn")


func _on_retryButton_mouse_exited():
	var style1 = StyleBoxFlat.new()
	style1.set_bg_color(Color("#a0a0a0"))
	style1.set_corner_radius_all(30)
	style1.set_border_width_all(20)
	style1.set_border_color(Color("cccccc"))
	$Panel/retryButton/.set('custom_styles/panel', style1)


func _on_quitButton_mouse_exited():
	var style1 = StyleBoxFlat.new()
	style1.set_bg_color(Color("#a0a0a0"))
	style1.set_corner_radius_all(30)
	style1.set_border_width_all(20)
	style1.set_border_color(Color("cccccc"))
	$Panel/quitButton/.set('custom_styles/panel', style1)


func _on_menuButton_mouse_exited():
	var style1 = StyleBoxFlat.new()
	style1.set_bg_color(Color("#a0a0a0"))
	style1.set_corner_radius_all(30)
	style1.set_border_width_all(20)
	style1.set_border_color(Color("cccccc"))
	$Panel/menuButton/.set('custom_styles/panel', style1)
