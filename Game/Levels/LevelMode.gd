extends Node

enum Dificulty {EASY, NORMAL, HARD}
var dificulty

enum Time {SHORT, MEDIUM, LONG}
var time

func unpressed_difficulty():
	$Easy.pressed = false
	$Normal.pressed = false
	$Hard.pressed = false
	
func unpressed_time():
	$Short.pressed = false
	$Medium.pressed = false
	$Long.pressed = false

func activate_contiune():
	print(dificulty)
	print(time)
	
	if dificulty != null and time != null:
		$Continue.disabled = false

func _on_Back_pressed():
	get_tree().change_scene("res://Game/MainScreens/ShowProfile.tscn")

func _on_Easy_pressed():
	unpressed_difficulty()
	$Easy.pressed = true
	dificulty = Dificulty.EASY
	activate_contiune()

func _on_Normal_pressed():
	unpressed_difficulty()
	$Normal.pressed = true
	dificulty = Dificulty.NORMAL
	activate_contiune()

func _on_Hard_pressed():
	unpressed_difficulty()
	$Hard.pressed = true
	dificulty = Dificulty.HARD
	activate_contiune()

func _on_Short_pressed():
	unpressed_time()
	$Short.pressed = true
	time = Time.SHORT
	activate_contiune()

func _on_Medium_pressed():
	unpressed_time()
	$Medium.pressed = true
	time = Time.MEDIUM
	activate_contiune()

func _on_Long_pressed():
	unpressed_time()
	$Long.pressed = true
	time = Time.LONG
	activate_contiune()

func _on_Continue_pressed():
	get_tree().change_scene("res://Game/Levels/PrepareBattle.tscn")
