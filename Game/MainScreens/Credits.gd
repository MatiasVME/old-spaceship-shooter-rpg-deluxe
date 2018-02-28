extends Node

func _on_RichTextLabel_meta_clicked( meta ):
	OS.shell_open(meta)

func _on_Back_pressed():
	get_tree().change_scene("res://Game/MainScreens/Menu.tscn")
