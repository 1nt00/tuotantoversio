extends Area2D

var hasKey = false

func _ready():
	pass

signal keyInLock


func _on_lock_body_entered(body):
	if hasKey == true:
		emit_signal("keyInLock")
		$AudioStreamPlayer.play(0.0)
		$AnimatedSprite.play("keyInLock")


func _on_Area2D_keyCollected():
	hasKey = true
