extends Node

func _ready():
	MusicManager.select_music(MusicManager.INTRO)
	MusicManager.play_music()

func _on_ToMenu_timeout():
	get_tree().change_scene("res://Game/MainScreens/Menu.tscn")

func _on_Timer_timeout():
	SoundManager.select_sound(SoundManager.LOGO_SOUND)
	SoundManager.play_sound()
