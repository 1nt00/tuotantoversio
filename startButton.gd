extends Panel



func _ready():
	pass	

func _on_startButton_gui_input(_event):
	
	if Input.is_action_pressed("Click"):
		get_tree().change_scene("res://Level1.tscn")

