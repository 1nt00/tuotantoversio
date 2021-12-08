extends CanvasLayer

var coins = 0
var health = 5
var playerInPortal = false
signal noHealth

func _ready():
	
	
	
	if health <= 0:
		emit_signal("noHealth")
	
	#muuttujan coins lukumäärä tulee HUDiin
	$Coins.text = String(coins)
	$Lives.text = String(health)
	
	if playerInPortal == true and coins >= 2:
		get_tree().change_scene("res://Level2.tscn")

func _on_coin_collected():
	coins = coins +1
	_ready()
#kun saadaan kolikolta signaali, 
#että kolikko on kerätty, niin
#coins-muuttuja suurenee yhdellä


func _on_enemy_playerHit():
	$hurt2.play(0.0)
	health = health -1
	_ready()


#kun pelaaja on portaalin hitboxissa
func _on_Portal_body_entered(body):
	playerInPortal = true 
	#jos pelaaja on portaalissa, ja kolikoita on 9, 
	#niin vaihdetaan tasoa
	if playerInPortal == true and coins >= 9:
		get_tree().change_scene("res://Level2.tscn")

func _on_Portal_body_exited(body):
	playerInPortal = false
