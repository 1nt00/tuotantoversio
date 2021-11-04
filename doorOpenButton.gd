extends Node2D

signal buttonPressed #luodaan uusi signaali, jonka tämä Node voi signaloida

func _on_Area2D_body_entered(body):
	
	#Kun tietyn hitboxin sisällä on esim. pelaaja, niin
	#muutetaan Collision-hitboxin kokoa pienemmäksi
	#ja lähetetään buttonPressed-signaali
	$buttonPress.play(0.0)
	$AnimatedSprite/StaticBody2D/CollisionPolygon2D.scale.y = 0.1
	$AnimatedSprite.play("pressed")
	
	emit_signal("buttonPressed")
	

