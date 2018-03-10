extends Node

func _on_Back_pressed():
	get_tree().change_scene("res://Game/MainScreens/ShowProfile.tscn")

func _on_Start_pressed():
	get_tree().change_scene("res://Game/Levels/PrepareBattle.tscn")
