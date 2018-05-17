extends RigidBody2D

export (float) var life_time = 1
export (int) var speed = 300

var damage = 1

var is_explosive = false
var explode = false

var direction = null setget set_direction

func _ready():
	# Carga la data alternativa si no hay data cargada,
	# es para ejecutar escenas individualmente.
#	Persistence.load_alternative_data()
	
	apply_impulse(Vector2(0,0), direction * speed)
	SoundManager.select_sound(SoundManager.ENEMY_BULLET)
	SoundManager.play_sound()
	
	$LifeTime.wait_time = life_time

func set_direction(_direction):
	direction = _direction

func _on_EnemyBullet_body_entered( body ):
	if Main.player_mark_to_dead or Main.player_is_inmortal:
		return
	
#	if body.is_in_group("Player"):
#		body.get_node("Anim").play("dead")
#
#		Main.player_can_move = false
#		Main.player_mark_to_dead = true
#
#		SoundManager.select_sound(SoundManager.GOOD_SHIP_DEAD)
#		SoundManager.play_sound()
	
	if body.is_in_group("PlayerBullet") and not is_explosive:
		is_explosive = true
		$Anim.play("can_explode")
		$LifeTime.wait_time += 1
		self.set_collision_layer_bit(0, true)
		
		SoundManager.select_sound(SoundManager.REBOUND)
		SoundManager.play_sound()
		
	elif is_explosive and body.is_in_group("Enemies") and not explode:
		$Anim.play("explode")
		
		var explosive_increase_damage = 4# Persistence.get_account_data()["PlayerStats"].stats["ExplosiveBullet"] * 2.5
#		print(Persistence.get_account_data()["PlayerStats"].stats["ExplosiveBullet"])
		
		body.life -= 10 + explosive_increase_damage
		body.xp_value += 1
		explode = true
		
		SoundManager.select_sound(SoundManager.EXPLOSION)
		SoundManager.play_sound()

func _on_LifeTime_timeout():
	$Anim.play("dead")

func _on_Anim_animation_finished( anim_name ):
	if anim_name == "dead" or anim_name == "explode":
		queue_free()
