extends Area2D

signal jumpBoots_collected

func _on_jumpBoots_body_entered(body):
	
	$AudioStreamPlayer.volume_db = -10.0	#Toistetaan ääniefekti
	emit_signal("jumpBoots_collected")
	$AudioStreamPlayer.play(0.1); yield($AudioStreamPlayer, "finished")
	$AudioStreamPlayer.stop()

	queue_free()
