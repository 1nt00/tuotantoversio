extends Panel


func _ready():
	pass


func _on_exitButton_gui_input(event):
	if Input.is_action_pressed("Click"):
		get_tree().change_scene("res://Menu.tscn")


func _on_exitButton_mouse_entered():
	var style1 = StyleBoxFlat.new()
	style1.set_bg_color(Color("d4db92"))
	style1.set_corner_radius_all(30)
	style1.set_border_width_all(20)
	style1.set_border_color(Color("393939"))
	
	$exitButton.set('custom_styles/panel', style1)


func _on_exitButton_mouse_exited():
	var style2 = StyleBoxFlat.new()
	style2 = load("res://tutorial.tres")
	$exitButton.set('custom_styles/panel', style2)
