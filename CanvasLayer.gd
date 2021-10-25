extends CanvasLayer

func _on_startButton_mouse_entered():
	#kun hiiri on startButtonin sisällä, 
	#määritellään uusi tyyli ja asetetaan
	#uusi tyyli sen tyyliksi
	var style1 = StyleBoxFlat.new()
	style1.set_bg_color(Color("d4db92"))
	style1.set_corner_radius_all(30)
	style1.set_border_width_all(20)
	style1.set_border_color(Color("292929"))
	
	$Background/startButton.set('custom_styles/panel', style1)


func _on_startButton_mouse_exited():
	#kun hiiri poistuu startButtonin sisältä,
	#asetetaan sen tyyliksi Menu.tres tyylitiedosto
	var style2 = StyleBoxFlat.new()
	style2 = load("res://Menu.tres")
	
	$Background/startButton.set('custom_styles/panel', style2)
	


func _on_exitButton_gui_input(event):
	
	if Input.is_action_pressed("Click"):
		get_tree().quit()
