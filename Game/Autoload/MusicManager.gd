extends Node

onready var intro = $Intro
onready var battle = $Battle

enum Music {INTRO, BATTLE}
var current_music = null

func select_music(p_music):
	if not Main.music_enable:
		return
	
	if current_music != null:
		current_music.stop()
	
	match p_music:
		Music.INTRO :
			current_music = intro
		Music.BATTLE :
			current_music = battle
		
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