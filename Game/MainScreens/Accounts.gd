extends Node

var num_of_accounts = 0

func _ready():
	Persistence.load_accounts()
	num_of_accounts = Persistence.get_accounts().size()
	
	if num_of_accounts == 1:
		$AccountPanel1.show_account(Persistence.get_accounts()[1 - 1])
	elif num_of_accounts == 2:
		$AccountPanel1.show_account(Persistence.get_accounts()[1 - 1])
		$AccountPanel2.show_account(Persistence.get_accounts()[2 - 1])
	elif num_of_accounts == 3:
		$AccountPanel1.show_account(Persistence.get_accounts()[1 - 1])
		$AccountPanel2.show_account(Persistence.get_accounts()[2 - 1])
		$AccountPanel3.show_account(Persistence.get_accounts()[3 - 1])
	elif num_of_accounts == 4:
		$AccountPanel1.show_account(Persistence.get_accounts()[1 - 1])
		$AccountPanel2.show_account(Persistence.get_accounts()[2 - 1])
		$AccountPanel3.show_account(Persistence.get_accounts()[3 - 1])
		$AccountPanel3.show_account(Persistence.get_accounts()[4 - 1])

func _on_Back_pressed():
	get_tree().change_scene("res://Game/MainScreens/Menu.tscn")