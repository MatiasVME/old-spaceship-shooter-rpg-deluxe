extends RigidBody2D

export (int) var max_life = 6
export (int) var min_life = 3

#export (int) var score_value = 5
export (int) var xp_value = 1

export (float) var max_wait_time = 1
export (float) var min_wait_time = 3

export (int) var one_of_each = 30

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

func _ready():
	randomize()
	
# TODO: Cambiar a que sea un item random en vez de una vida
func drop_life_if_can(): 
	var prob = rand_range(1, one_of_each)
	
	if prob < 2:
		var rec_life = load("res://Game/Actors/PowerUps/Live/Life.tscn")
		var life = rec_life.instance()
		
		life.global_position = self.global_position
		
		get_parent().add_child(life)
		life.impulse()

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
		apply_impulse(Vector2(0, 0), Vector2(-500, 0))

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