extends Node

func _on_Anim_animation_finished(anim_name):
	if anim_name == "exit":
		get_tree().quit()
