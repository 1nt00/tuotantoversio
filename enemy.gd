extends KinematicBody2D

onready var path_follow = get_parent()
var speed = 2
var move_direction = 0

func _physics_process(delta):
	
	MovementLoop(delta)

func MovementLoop(delta):
	var prepos = path_follow.get_global_position()
	path_follow.set_offset(path_follow.get_offset() + speed + delta)
	var pos = path_follow.get_global_position()
	move_direction = (pos.angle_to_point(prepos) / 3.14) * 180


signal playerHit 		#luodaan uusi signaali, joka signaloi
						#HUDille, että pelaaja osui viholliseen
				
func _on_Area2D_body_entered(body):
	emit_signal("playerHit")
