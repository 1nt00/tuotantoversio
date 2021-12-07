extends KinematicBody2D

var velocity = Vector2(0,0)
var GRAVITY = 40
var JUMPFORCE = -1070
var SPEED = 390
var isPlayerDead = false
var hasJumpBoots = false
var watchingright = true
var shake_amount = 4.3

func _physics_process(delta):
	
	$Camera2D.zoom_in(position - $Camera2D.get_camera_position())
	
	
	$Camera2D.set_offset(Vector2( \
	rand_range(-1.0, 1.0) * shake_amount, \
	rand_range(-1.0, 1.0) * shake_amount \
	) )

	
	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene("res://Level1.tscn")	
	
	
	#pelaajan täytyy olla elossa, jotta hahmoa voi ohjata 
	if isPlayerDead == false: 
		
		if $AudioStreamPlayer.playing == false:
			$AudioStreamPlayer.play(0.0)
		
	#kun paientaan "oikealle" niin hahmo liikkuu oikealle
		if Input.is_action_pressed("right"):
			watchingright = true
			velocity.x = SPEED
			$Sprite.play("Walk2")
			
			
	#kun paientaan "vasemmalle" niin hahmo liikkuu vasemmalle
		elif Input.is_action_pressed("left"):
			velocity.x = -SPEED
			watchingright = false
			$Sprite.play("WalkLeft2")
			
			
			
	#kun paientaan "alas" niin hahmo menee kyykkyyn
		elif Input.is_action_pressed("down"):
			$Sprite.play("Crouch")
		
		
	#mitään ei paineta, hahmo palaa alkuasentoon
		elif watchingright == true:
			$Sprite.play("IdleJB")
			
		elif watchingright == false:
			$Sprite.play("IdleJBL")
			
	
	#jos hahmo on ilmassa, tositetaan "air -animaatio"
		if not is_on_floor():
			
			if watchingright == true: 
				$Sprite.play("AirJB")
			
					
			if watchingright == false:
				$Sprite.play("Air2JB")	
		
		elif not is_on_floor() and Input.is_action_pressed("left"):
			$Sprite.play("Air")
		
	
		velocity.y = velocity.y + GRAVITY
	
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMPFORCE
			
		
		#Kun hahmo on seinällä, voi hypätä
		if Input.is_action_just_pressed("jump") and is_on_wall():
			velocity.y = JUMPFORCE
			$Sprite.play("Jump")
			
	
		
		
		velocity = move_and_slide(velocity, Vector2.UP)

		velocity.x = lerp(velocity.x,0,0.2)
		
	else: $Sprite.play("Idle")
	

func _on_Area2D2_body_entered(body):
	get_tree().change_scene("res://gameOverL2.tscn")


func _on_exit_body_entered(body):
	get_tree().change_scene("res://Level3.tscn")
