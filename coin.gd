extends Area2D


signal coin_collected

func _on_coin_body_entered(body): #kun pelaaja koskettaa kolikkoa:
	
	
	emit_signal("coin_collected")	#lähetetään signaali, että kolikko on kerätty
	$AnimatedSprite.visible = false		#kolikon sprite muuttuu näkymättömäksi
	$AudioStreamPlayer.play(0.1); yield($AudioStreamPlayer, "finished")	#toistetaan ääniefekti
																	#vasta kun ääniefekti on päättynyt
																	#siirrytään koodissa eteenpäin
	queue_free()				#kerätty kolikko poistetaan pelistä
