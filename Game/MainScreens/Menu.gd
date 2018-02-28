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
	get_tree().quit()
	
func _on_Start_pressed():
	reset_level()
	
	MusicManager.select_music(MusicManager.BATTLE)
	MusicManager.play_music()
	
	get_tree().change_scene("res://Game/Levels/Level1.tscn")

func _on_SoundMenu_timeout():
	SoundManager.select_sound(SoundManager.MENU_SOUND)
	SoundManager.play_sound()
