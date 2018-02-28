extends Node

var is_win = false

var rec_player = load("res://Game/Actors/Player/Player.tscn")

func _ready():
	$CanvasLayer/ResultDisplay.text = "Level " + str(Main.current_level)
	$Anim.play_backwards("show")
	
	create_player()
	$HUD.update_life_board()
	
	update_score()
	
func _physics_process(delta):
	# Cuando pierde
	if Main.is_over and $Anim.assigned_animation != "is_over":
		reset_all()
		$Anim.play("is_over")
	
func create_player():
	Main.player_mark_to_dead = false
	
	var player = rec_player.instance()
	player.position = Vector2(Main.RES_X / 2, Main.RES_Y - 50)
	add_child(player)

	if Main.get_player() == null:
		Main.set_player($Player)

func reset_all(except_level = false):
	$HUD.update_life_board()
	Main.lifes = 3
	
	if not except_level:
		Main.current_level = 1
		
func update_score():
	$CanvasLayer/Score.text = str("Score: " + str(Main.score))
	
func save_high_score():
	if DataManager.is_high_score(Main.score):
		DataManager.new_score(Main.score)
		print("ok")

func _on_IsWin_timeout():
	update_score()
	
	Main.enemies_in_screen = get_tree().get_nodes_in_group("Enemies").size()
	
	# Cuando pasa de nivel
	if Main.enemies_in_screen <= 0:
		$CanvasLayer/ResultDisplay.text = "You Win"
		
		$Anim.play("show")
		$UpdateLabels.stop()
		is_win = true

func _on_Anim_animation_finished( anim_name ):
	if is_win and anim_name == "show":
		Main.enemies_can_fire = false
		Main.player_can_move = false
		Main.current_level += 1
		
		if Main.current_level > Main.LAST_LEVEL:
			reset_all(true)
			save_high_score()
			get_tree().change_scene("res://Game/MainScreens/Score.tscn")
		
		get_tree().change_scene(str("res://Game/Levels/Level" + str(Main.current_level) + ".tscn"))
	elif anim_name == "show":
		Main.enemies_can_fire = true
		Main.player_can_move = true
	
	if anim_name == "is_over":
		save_high_score()
		get_tree().change_scene("res://Game/MainScreens/Score.tscn")

func _on_IsDead_timeout():
	if Main.player_is_dead:
		create_player()
		$HUD.update_life_board()
