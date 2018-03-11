extends Node

func _ready():
	Persistence.load_account_data(Main.get_current_account())
	print("get_current_account: ", Main.get_current_account())
	print(Persistence.get_account_data())
	var stats = Persistence.get_account_data()["PlayerStats"].stats
	print(stats)

func _on_Play_pressed():
	get_tree().change_scene("res://Game/Levels/LevelMode.tscn")

func _on_Back_pressed():
	get_tree().change_scene("res://Game/MainScreens/Accounts.tscn")
