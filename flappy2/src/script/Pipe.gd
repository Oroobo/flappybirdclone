extends StaticBody2D

var playing := false

func _ready():
	global_position = Vector2(global_position.x,rand_range(220,300))
	
func _on_Play_button_up():
	playing = true
	start()

func _on_AreaMorte1_body_entered(body):
	playing = false
	stop()
	
func _on_TimerSpawn_timeout():
	global_position = Vector2(190,rand_range(210,310))
	
func _on_Area2D_body_entered(body):
	playing = false
	stop()

func _physics_process(delta):
	if playing == true:
		global_position += Vector2(-0.4,0)
#		if global_position.x <= -32:
#			global_position = Vector2(408,rand_range(220,300))

func start():
	$TimerSpawn.start()
	
func stop():
	$TimerSpawn.stop()
