extends Node

func reset_level():
	Main.current_level = 1
	Main.player_is_dead = false
	Main.player_mark_to_dead = false
	Main.is_over = false
	Main.score = 0

func _on_Credits_pressed():
	get_tree().change_scene("res://Game/MainScreens/Credits.tscn")

func _on_Exit_pressed():
	get_tree().change_scene("res://Game/MainScreens/ExitSplash.tscn")
	
func _on_Start_pressed():
#	reset_level()
#	
#	MusicManager.select_music(MusicManager.BATTLE)
#	MusicManager.play_music()
#
	get_tree().change_scene("res://Game/MainScreens/Accounts.tscn")

func _on_Connect_pressed():
	# Para conectarse con gamejolt u otros
	pass
