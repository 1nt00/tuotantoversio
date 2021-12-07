extends CanvasLayer


var time = 6100 #kuinka paljon aikaa on aluksi
				#yksi sekunti = 100

func _ready():
	$Panel/Sprite.visible = false

func _process(delta):
	
	$Panel/time.text = String(time / 100)	#näytöllä oleva teksti
											#on aika-muuttuja jaettuna
											#sadalla, eli yksi sekunti
	
	time = time -2		#poistetaan ajasta 2, 60 kertaa sekunnissa
	
	if time <= 0:		#kun aika on loppu, tulee game over
		
		get_tree().change_scene("res://gameOverL2.tscn")
		
		

func _on_Area2D_keyCollected():
	$Panel/qMark.visible = false
	$Panel/Sprite.visible = true
	$Panel/number.text = String("1")
