extends Node

func _ready():
	Persistence.load_alternative_data()
	
	print(Persistence.get_account_data()["PlayerInventory"])

func _on_Back_pressed():
	get_tree().change_scene("res://Game/Levels/LevelMode.tscn")
	