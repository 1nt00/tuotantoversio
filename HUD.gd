extends CanvasLayer

var coins = 0
var health = 3

func _ready():
	
	if health <= 0:
		get_tree().change_scene("res://Level1.tscn")
	
	#muuttujan coins lukumäärä tulee HUDiin
	$Coins.text = String(coins)
	$Lives.text = String(health)


func _on_coin_collected():
	coins = coins +1
	_ready()
#kun saadaan kolikolta signaali, 
#että kolikko on kerätty, niin
#coins-muuttuja suurenee yhdellä


func _on_enemy_playerHit():
	health = health -1
	_ready()


	
