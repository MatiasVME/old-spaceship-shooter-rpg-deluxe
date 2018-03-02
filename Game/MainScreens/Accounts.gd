extends Node

func _on_Back_pressed():
	get_tree().change_scene("res://Game/MainScreens/Menu.tscn")

func _on_Create_pressed1():
	create_account(1)

func _on_Create_pressed2():
	create_account(2)

func _on_Create_pressed3():
	create_account(3)

func _on_Create_pressed4():
	create_account(4)

func create_account(slot):
#	match slot:
#		1:
#			$AccountPanel1.start_create_account()
#		2:
#			$AccountPanel2.start_create_account()
#		3:
#			$AccountPanel3.start_create_account()
#		4:
#			$AccountPanel4.start_create_account()
	pass