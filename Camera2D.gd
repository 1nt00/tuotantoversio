extends Camera2D

var current_zoom 
var min_zoom 
var max_zoom 
var zoom_factor = 1.3 # < 1 = zoom_in; > 1 = zoom_out
var transition_time = 1.4

func _ready():
	max_zoom = zoom.x
	min_zoom = max_zoom * zoom_factor

func zoom_in(new_offset):
	transition_camera(Vector2(min_zoom, min_zoom), new_offset)


func zoom_out(new_offset):
	transition_camera(Vector2(max_zoom, max_zoom), new_offset)


func transition_camera(new_zoom, new_offset):
	if new_zoom != current_zoom:
		current_zoom = new_zoom
		$Tween.interpolate_property(self, "zoom", get_zoom(), current_zoom, transition_time, Tween.TRANS_EXPO)
		$Tween.interpolate_property(self, "offset", get_offset(), new_offset, transition_time, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
		$Tween.start()
