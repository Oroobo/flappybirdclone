extends KinematicBody2D

var velocity := Vector2()
export var jump := 300
export var gravity := 0
var playing := false
var sprite_pollo = preload("res://assets/sprites/bird2.png")
var sprite_capy = preload("res://assets/sprites/capy.png")
const SAVE_FILE_PATH = "user://savefile.save"
var sprite := 0

func _ready():
	load_skin()
	$AnimationPlayer.play("idle")
	velocity = Vector2.ZERO
	
func _on_AreaMorte1_body_entered(body):
	death()
	
func _on_Area2D_body_entered(body):
	death()
	
func _on_Play_button_up():
	playing = true
	velocity.y -= jump
	$AnimationPlayer.play("jump")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "death":
		get_tree().reload_current_scene()

func _on_ChangeSkin_button_up():
	if sprite == 1:
		sprite = 0
	else:
		sprite = 1
	change_skin(sprite)
	save_skin()

func change_skin(num):
	if num == 0:
		$Bird.texture = sprite_pollo
	else:
		$Bird.texture = sprite_capy

func save_skin():
	var save_data = File.new()
	save_data.open(SAVE_FILE_PATH, File.WRITE)
	save_data.store_var(sprite)
	save_data.close()
	
func load_skin():
	var save_data = File.new()
	if save_data.file_exists(SAVE_FILE_PATH):
		save_data.open(SAVE_FILE_PATH, File.READ)
		sprite = save_data.get_var()
		save_data.close()
		change_skin(sprite)
	
func _physics_process(delta):
	if playing == true:
		gravity = 500
		if Input.is_action_just_pressed("jump"):
			velocity.y -= jump
			$AnimationPlayer.play("jump")
			$SoundJump.play()
		
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.y += gravity * delta
	
	velocity.y = clamp(velocity.y, -150, 150)
	
	$CollisionShape2D.global_position = $Bird.global_position

func death():
	$AnimationPlayer.play("death")
	gravity = 0
	velocity = Vector2.ZERO
	playing = false
	$CollisionShape2D.disabled = true
	
