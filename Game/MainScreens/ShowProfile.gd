extends Node

func _ready():
	pass

func _on_Play_pressed():
	get_tree().change_scene("res://Game/Levels/LevelMode.tscn")

func _on_Back_pressed():
	get_tree().change_scene("res://Game/MainScreens/Accounts.tscn")
