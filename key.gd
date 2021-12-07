extends Area2D


signal keyCollected

func _on_Area2D_body_entered(body):
	
	
	emit_signal("keyCollected")
	$Sprite.visible = false
	$AudioStreamPlayer.play(0.1); yield($AudioStreamPlayer, "finished")
	
	queue_free()
