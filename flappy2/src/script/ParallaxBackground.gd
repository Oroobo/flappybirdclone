extends ParallaxBackground

var playing := true

func _process(delta):
	if playing == true:
		scroll_base_offset -= Vector2(-100,0) * delta
	else:
		scroll_base_offset -= Vector2(0,0) * delta
func _on_AreaMorte1_body_entered(body):
	playing = false

func _on_Play_button_up():
	playing = true

func _on_Area2D_body_entered(body):
	playing = false
