extends Node

#func reset_level():
#	Main.current_level = 1
#	Main.player_is_dead = false
#	Main.player_mark_to_dead = false
#	Main.is_over = false

func _on_Modes_pressed():
	MusicManager.select_music(MusicManager.BOSS)
	MusicManager.play_music()
	
	get_tree().change_scene("res://Game/Tests/TestBoss.tscn")
