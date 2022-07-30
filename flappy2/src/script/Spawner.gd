extends StaticBody2D

var playing := false

func _ready():
	global_position = Vector2(global_position.x,rand_range(220,300))

func _physics_process(delta):
	if playing == true:
		global_position += Vector2(-0.5,0)
		if global_position.x <= -32:
			global_position = Vector2(408,rand_range(220,300))

func _on_Play_button_up():
	playing = true

func _on_AreaMorte1_body_entered(body):
	playing = false

func _on_Timer_timeout():
	spawn_pipe()
	
func spawn_pipe():
	var pipe = self.instan
	self.add_child()
