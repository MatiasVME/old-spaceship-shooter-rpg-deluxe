extends NinePatchRect

func _on_Label_gui_input(ev):
	if ev.is_action_pressed("left_click"):
		print("left_click")


func _on_AccountPanel_gui_input(ev):
	if ev.is_action_pressed("left_click"):
		print("left_click")
