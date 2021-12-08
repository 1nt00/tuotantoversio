extends CanvasLayer

var time = 480
var hasPlayed = false
var isOver = false
func _process(delta):
	time = time -2
	if time <= 0:
		if hasPlayed == false:
			$Panel/win/AnimationPlayer.play("scroll")
			$Panel/credits/AnimationPlayer.play("scrollCredits")
			
		hasPlayed = true
		isOver = true
	if time <= -1800 :
		if Input.is_action_pressed("continue") and isOver == true:
			get_tree().change_scene("res://Menu.tscn")

func _ready():
	$black/AnimationPlayer.play("fadeOut")
