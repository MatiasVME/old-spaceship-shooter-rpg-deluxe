extends Node

func _ready():
	$NewRecord.visible = false
	
	var text = "Current Score: " + str(Main.score)
	$VBox/CurrentScore.text = text
	
	Persistence.load_data()
	text = "Max Score: " + str(Persistence.data["Score"])
	$VBox/MaxScore.text = text
	
	if Main.score == Persistence.data["Score"]:
		$NewRecord.visible = true
		$AnimNewRecord.play("show_new_record")

func _on_AnimNewRecord_animation_finished( anim_name ):
	if anim_name == "show_new_record":
		$AnimNewRecord.play("idle_new_record")

func _on_Menu_pressed():
	get_tree().change_scene("res://Game/MainScreens/Menu.tscn")
