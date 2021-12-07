extends Area2D

var hasKey = false

func _ready():
	pass

signal keyInLock


func _on_lock_body_entered(body):
	if hasKey == true:
		emit_signal("keyInLock")
		$AnimatedSprite.play("keyInLock")


func _on_Area2D_keyCollected():
	hasKey = true
