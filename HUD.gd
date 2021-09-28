extends CanvasLayer

var coins = 0

func _ready():
	
	#muuttujan coins lukumäärä tulee HUDiin
	$Coins.text = String(coins)



func _on_coin_collected():
	coins = coins +1
	_ready()
#kun saadaan kolikolta signaali, 
#että kolikko on kerätty, niin
#coins-muuttuja suurenee yhdellä
