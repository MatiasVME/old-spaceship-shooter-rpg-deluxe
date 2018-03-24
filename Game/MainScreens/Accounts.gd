extends Node

func _ready():
	var num_of_accounts = Persistence.get_profiles().size()
	
	if num_of_accounts == 1:
		$AccountPanel1.show_account(Persistence.get_profiles()[1 - 1])
	elif num_of_accounts == 2:
		$AccountPanel1.show_account(Persistence.get_profiles()[1 - 1])
		$AccountPanel2.show_account(Persistence.get_profiles()[2 - 1])
	elif num_of_accounts == 3:
		$AccountPanel1.show_account(Persistence.get_profiles()[1 - 1])
		$AccountPanel2.show_account(Persistence.get_profiles()[2 - 1])
		$AccountPanel3.show_account(Persistence.get_profiles()[3 - 1])
	elif num_of_accounts == 4:
		$AccountPanel1.show_account(Persistence.get_profiles()[1 - 1])
		$AccountPanel2.show_account(Persistence.get_profiles()[2 - 1])
		$AccountPanel3.show_account(Persistence.get_profiles()[3 - 1])
		$AccountPanel3.show_account(Persistence.get_profiles()[4 - 1])

func _on_Back_pressed():
	get_tree().change_scene("res://Game/MainScreens/Menu.tscn")