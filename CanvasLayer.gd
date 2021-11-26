extends CanvasLayer

func _on_startButton_mouse_entered():
	#kun hiiri on startButtonin sisällä, 
	#määritellään uusi tyyli ja asetetaan
	#uusi tyyli sen tyyliksi
	var style1 = StyleBoxFlat.new()
	style1.set_bg_color(Color("#a7ad6d"))
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

	#kun hiiri on nappulan kohdalla, vaihdetaan tyyliä
func _on_howtoButton_mouse_entered():
	var style1 = StyleBoxFlat.new()
	style1.set_bg_color(Color("#5a8a76"))		#taustan väri
	style1.set_corner_radius_all(30)			#reunojen kaarevuus
	style1.set_border_width_all(20)				#reunojen leveys
	style1.set_border_color(Color("292929"))	#reunojen väri
	
	$Background/howtoButton.set('custom_styles/panel', style1)
	
	


func _on_howtoButton_gui_input(event):
	if Input.is_action_pressed("Click"):
		get_tree().change_scene("res://tutorial.tscn")


func _on_exitButton_mouse_exited():
	var style2 = StyleBoxFlat.new()
	style2 = load("res://tutorial.tres")
	$Background/exitButton.set('custom_styles/panel', style2)


func _on_howtoButton_mouse_exited():
	var style2 = StyleBoxFlat.new()
	style2 = load("res://tutorial.tres")
	$Background/howtoButton.set('custom_styles/panel', style2)


func _on_exitButton_mouse_entered():
	var style1 = StyleBoxFlat.new()
	style1.set_bg_color(Color("#a8727d"))
	style1.set_corner_radius_all(30)
	style1.set_border_width_all(20)
	style1.set_border_color(Color("292929"))
	$Background/exitButton.set('custom_styles/panel', style1)
