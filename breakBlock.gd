extends Area2D


func _ready():
	pass
	



func _on_Area2D_body_entered(body):
	
	$Sprite.play("break")
	$AudioStreamPlayer2D.volume_db = 2.0
	

	$AudioStreamPlayer2D.play(0.0); yield($AudioStreamPlayer2D, "finished")
	$AudioStreamPlayer2D.stop()
	queue_free()
