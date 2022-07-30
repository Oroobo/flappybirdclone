extends Button

var player = preload("res://src/scenes/Player.tscn")

func _ready():
	$AnimationPlayer.play("reverse")

func _on_Play_button_up():
	$AnimationPlayer.play("start")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "death":
		$AnimationPlayer.play("reverse")

