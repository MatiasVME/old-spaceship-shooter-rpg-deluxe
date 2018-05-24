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
	
	move_and_collide(Vector2(move_x, move_y))
	
func fire():
	var laser = rec_laser.instance()
	laser.global_position.y = $Image.global_position.y - 40
	laser.global_position.x = $Image.global_position.x
	get_parent().add_child(laser)
	
	SoundManager.select_sound(0)
	SoundManager.play_sound()
	
func movement_x(speed):
	if OS.get_name() != "Android":
		direction = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))

	if Main.direction == 1 and not is_limited_right():
		move_x = speed
	elif Main.direction == -1 and not is_limited_left():
		move_x = -speed
	else:
		move_x = 0
	
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
		pass
		# TODO
		queue_free()
	elif anim_name == "start":
		Main.player_is_inmortal = false

func _on_HitArea_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("EnemyBullet"):
		body.queue_free()
	
func _on_TimeToFire_timeout():
	if Main.button_can_fire:
		fire()