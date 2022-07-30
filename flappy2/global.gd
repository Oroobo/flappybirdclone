extends Node

func _ready():
	SilentWolf.configure({
		"api_key": "KgGuXhEiov5iprFA1RTTX69hbC91HWnG76UGW3uq",
		"game_id": "flappybara",
		"game_version": "1.0.2",
		"log_level": 1
		})
	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/MainPage.tscn"
		})
