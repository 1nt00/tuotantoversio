extends Area2D

	#kun pelaaja koskettaa palikan CollisionShape2D:tä, niin:
func _on_Area2D_body_entered(_body):
	
	$Sprite.play("break")					#toistetaan hajoamis-animaatio
	$AudioStreamPlayer2D.volume_db = 3.2	#Toistetaan ääniefekti
	
	$AudioStreamPlayer2D.play(0.0); yield($AudioStreamPlayer2D, "finished")
	$AudioStreamPlayer2D.stop()
	#Kun ääniefekti on päättynyt, koko palikka häviää.
	queue_free()
