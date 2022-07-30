extends Control

var score := 0
const SAVE_FILE_PATH = "user://savedata.save"
var highscore := 0

func _ready():
	load_highscore()
	$Highscore2.set_text("highscore\n" + str(highscore))

func _on_Obj_body_exited(body):
	score += 1
	$Score2.set_text(str(score))
	if highscore < score:
		highscore = score
		save_highscore()
	$Highscore2.set_text("highscore\n" + str(highscore))

func save_highscore():
	var save_data = File.new()
	save_data.open(SAVE_FILE_PATH, File.WRITE)
	save_data.store_var(highscore)

func load_highscore():
	var save_data = File.new()
	if save_data.file_exists(SAVE_FILE_PATH):
		save_data.open(SAVE_FILE_PATH, File.READ)
		highscore = save_data.get_var()
		save_data.close()

func _on_Leaderboard_pressed():
	if $NicknameSubmit.visible == true:
		$NicknameSubmit.visible = false
	else: 
		$NicknameSubmit.visible = true
