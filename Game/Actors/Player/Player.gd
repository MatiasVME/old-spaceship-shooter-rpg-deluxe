extends KinematicBody2D

export (float) var speed = 2.5
export (bool) var auto_fire = false # TODO

var rec_laser = load("res://Game/Actors/Bullets/Lasers/Laser.tscn")

var direction = 0

var move_x = 0
var move_y = 0

func _ready():
	Main.player_is_inmortal = true

func _physics_process(delta):
	if not Main.player_can_move:
		return
	
	movement_x(speed)
	movement_y(speed)
	
	move_and_collide(Vector2(move_x, move_y))
	
	fire()
	
func fire():
	if Input.is_action_just_pressed("ui_accept"):
		var laser = rec_laser.instance()
		laser.global_position.y = $Image.global_position.y - 40
		laser.global_position.x = $Image.global_position.x
		get_parent().add_child(laser)
		
		SoundManager.select_sound(0)
		SoundManager.play_sound()
	
func movement_x(speed):
	direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))

	if direction == 1 and not is_limited_right():
		move_x = speed
	elif direction == -1 and not is_limited_left():
		move_x = -speed
	else:
		move_x = 0

func movement_y(speed):
	direction = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	
	if direction == 1 and not is_limited_up():
		move_y = -speed
	elif direction == -1 and not is_limited_down():
		move_y = speed
	else:
		move_y = 0
	
func is_limited_right():
	if global_position.x > Main.RES_X - 50:
		return true
		
	return false
	
func is_limited_left():
	if global_position.x < 0 + 50:
		return true
		
	return false
	
func is_limited_up():
	if global_position.y < Main.RES_Y / 2 + 50:
		return true
	
	return false
	
func is_limited_down():
	if global_position.y > Main.RES_Y - 50:
		return true
	
	return false

func _on_Anim_animation_finished( anim_name ):
	if anim_name == "dead":
		if Main.lifes > 1:
			get_parent().create_player()
			Main.player_can_move = true
			Main.lifes -= 1
			get_parent().get_node("HUD").update_life_board()
		else:
			Main.is_over = true
		
		queue_free()
	elif anim_name == "start":
		Main.player_is_inmortal = false
