# BadBossShip.gd

extends "../EnemyShip.gd"

var rec_bullet = load("res://Game/Actors/Bullets/EnemyBullet/EnemyBullet.tscn")

var mark_to_dead = false
var life

var limit_right
var limit_left

var spawn_y

var velocity_x = 0.5
var velocity_y = 0.5
var velocity_increment_x = 1
var velocity_increment_y = 1

enum MovementX {LEFT, RIGHT}
var current_movement_x = MovementX.LEFT
enum MovementY {UP, DOWN}
var current_movement_y

var first_impulse = true

var rotated_fire = 0

func _ready():
	self.max_wait_time = 0.3
	self.min_wait_time = 0.2
	
	spawn_y = global_position.y
	
	limit_right = $LimitRight.global_position.x
	limit_left = $LimitLeft.global_position.x
	
	randomize()
	life = int(rand_range(min_life, max_life + 1) - 0.01)
	
	$Anim.play("show")
	
	$TimeToFire.wait_time = rand_range(min_wait_time, max_wait_time)
	$TimeToFire.start()
	
func _physics_process(delta):
	adjust_increment_x()
	movement_x()
	movement_y()
		
func adjust_increment_x():
	if linear_velocity.x > 5 or linear_velocity.x < -5:
		velocity_increment_x += 0.01
	else:
		velocity_increment_x = 1

func movement_x():
	if not is_limit_left() and current_movement_x == MovementX.LEFT:
		if linear_velocity.x < 10:
			apply_impulse(Vector2(0, 0), Vector2(-velocity_x * velocity_increment_x, 0))
			
			if first_impulse:
				apply_impulse(Vector2(0, 0), Vector2(-velocity_x * 100, 0))
				first_impulse = false
	elif not is_limit_right() and current_movement_x == MovementX.RIGHT:
		apply_impulse(Vector2(0, 0), Vector2(velocity_x  * velocity_increment_x, 0))

func movement_y():
	if is_limit_up() and current_movement_y == MovementY.UP:
		if linear_velocity.y > 10:
			apply_impulse(Vector2(0, 0), Vector2(0, -velocity_y * velocity_increment_y))
	elif is_limit_down() and current_movement_y == MovementY.UP:
		apply_impulse(Vector2(0, 0), Vector2(0, velocity_y * velocity_increment_y))

func is_limit_left():
	if global_position.x <= limit_left:
		current_movement_x = MovementX.RIGHT
		apply_impulse(Vector2(0, 0), Vector2(25, 0))
		
		return true
		
	return false
	
func is_limit_right():
	if global_position.x >= limit_right:
		current_movement_x = MovementX.LEFT
		apply_impulse(Vector2(0, 0), Vector2(-500 * 4, 0))

		return true
		
	return false
	
func is_limit_up():
	if global_position.y <= spawn_y - 40:
		current_movement_y = MovementY.DOWN
		apply_impulse(Vector2(0, 0), Vector2(0, 50))
		return true
		
	return false

func is_limit_down():
	if global_position.y >= spawn_y + 40:
		current_movement_y = MovementY.UP
		apply_impulse(Vector2(0, 0), Vector2(0, -50))
		return true
		
	return false

func _on_BadShip_body_entered( body ):
	if body.is_in_group("Bullet"):
		if not $Anim.assigned_animation == "dead":
			$Anim.play("damage")
			
		life -= 1
		
		SoundManager.select_sound(int(rand_range(1,3) - 0.1))
		SoundManager.play_sound()
		
		if life <= 0 and $Anim.assigned_animation != "dead":
			mark_to_dead = true
			$TimeToDead.start()
			$Anim.play("dead")
			Main.enemies_can_fire = false

func _on_TimeToDead_timeout():
	Main.score += score_value
	queue_free()

func _on_TimeToFire_timeout():
	if not Main.enemies_can_fire:
		return
	
	$TimeToFire.wait_time = rand_range(min_wait_time, max_wait_time)
	
	rotated_fire -= 20
	
	var bullet = rec_bullet.instance()
	var dest = $Image.global_position
	dest.y *= 2
	var direction = (dest - $Image.global_position).normalized()
	bullet.set_direction(direction.rotated(rotation + deg2rad(rotated_fire)))
	
	bullet.global_position.y = $Image.global_position.y
	bullet.global_position.x = $Image.global_position.x
	get_parent().add_child(bullet)


	# bullet2
	
	var bullet2 = rec_bullet.instance()
	dest = $Image.global_position
	dest.y *= 2
	direction = (dest - $Image.global_position).normalized()
	bullet2.set_direction(direction.rotated(rotation + deg2rad(rotated_fire - 180)))
	
	bullet2.global_position.y = $Image.global_position.y
	bullet2.global_position.x = $Image.global_position.x
	get_parent().add_child(bullet2)