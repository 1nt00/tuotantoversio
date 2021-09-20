extends KinematicBody2D

var velocity = Vector2(0,0)
var SPEED = 370
const GRAVITY = 40
var JUMPFORCE = -800
var isPlayerDead = false
var hasJumpBoots = false
var watchingright = true

func _physics_process(delta):
	
	
	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene("res://Level1.tscn")	
	
	
	#pelaajan täytyy olla elossa, jotta hahmoa voi ohjata 
	if isPlayerDead == false: 
		
	#kun paientaan "oikealle" niin hahmo liikkuu oikealle
		if Input.is_action_pressed("right"):
			watchingright = true
			velocity.x = SPEED
			#jos pelaajalla on jump boots -kengät, niin sprite on erilainen
			if hasJumpBoots == true:
				$Sprite.play("Walk2")
			else: 
				$Sprite.play("Walk")
			
	#kun paientaan "vasemmalle" niin hahmo liikkuu vasemmalle
		elif Input.is_action_pressed("left"):
			velocity.x = -SPEED
			$Sprite.play("WalkLeft")
			watchingright = false
			
	#kun paientaan "alas" niin hahmo menee kyykkyyn
		elif Input.is_action_pressed("down"):
			$Sprite.play("Crouch")
		
		
	#mitään ei paineta, hahmo palaa alkuasentoon
		elif watchingright == true:
			$Sprite.play("Idle")
		elif watchingright == false:
			$Sprite.play("Idle2")
	
	#jos hahmo on ilmassa, tositetaan "air -animaatio"
		if not is_on_floor():
			
			if watchingright == true: 
				$Sprite.play("Air")
			if watchingright == false:
				$Sprite.play("AirL")		
		
		elif not is_on_floor() and Input.is_action_pressed("left"):
			$Sprite.play("Air")
		
	
		velocity.y = velocity.y + GRAVITY
	
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMPFORCE
			$Sprite.play("Jump")
	
		
		
		if Input.is_action_just_pressed("jump") and is_on_wall():
			velocity.y = JUMPFORCE
			$Sprite.play("Jump")
		
		
	 
		
	velocity = move_and_slide(velocity, Vector2.UP)

	velocity.x = lerp(velocity.x,0,0.2)




func _on_hazard_body_entered(body):					# 1. kun pelaaja koskettaa "hazard"-hitboxia, niin: 
	isPlayerDead = true								# 2. pelaaja "kuolee"
	$Label.text = "KUOLIT"							# 3. Näytölle tulee teksti "KUOLIT"
	$Timer.start(1.0); yield($Timer, "timeout") 	# 4. Käynnistetään sekunnin ajastin, jonka jälkeen: ->
	get_tree().change_scene("res://gameover.tscn")	# 5. taso ladataan alusta


func _on_itemJumpBoot_body_entered(body):
	hasJumpBoots = true
	JUMPFORCE = -1070
	
func _on_Door_body_entered(body):
	get_tree().change_scene("res://Level2.tscn")



#kun _cameraZoomArealta poistutaan, niin kameran zoom-arvo muuttuu
func _on_cameraZoomArea_body_exited(body):
	$Camera2D.zoom.x = 0.8
	$Camera2D.zoom.y = 0.8
	
