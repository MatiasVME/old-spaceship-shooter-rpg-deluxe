extends Node

enum Music {INTRO, BATTLE, BOSS, END_LEVEL}
var current_music = null

func select_music(p_music):
	if not Main.music_enable:
		return
	
	if current_music != null:
		current_music.stop()
	
	match p_music:
		Music.INTRO:
			current_music = $Intro
		Music.BATTLE:
			current_music = $Battle
		Music.BOSS:
			current_music = $Boss
		Music.END_LEVEL:
			current_music = $EndLevel
	
func play_music():
	if not Main.music_enable:
		return
	
	if current_music != null:
		current_music.play()
		
func stop_music():
	if not Main.music_enable:
		return
	
	if current_music != null:
		current_music.stop()