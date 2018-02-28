extends RigidBody2D

var direction = null setget set_direction

func _ready():
	apply_impulse(Vector2(0,0), direction * 300)

func set_direction(_direction):
	direction = _direction

func _on_EnemyBullet_body_entered( body ):
	print("aaagggrrrrhhh")
	if body.is_in_group("Player"):
		body.get_node("Anim").play("dead")
		Main.player_can_move = false
		Main.player_mark_to_dead = true

func _on_LifeTime_timeout():
	$Anim.play("dead")

func _on_Anim_animation_finished( anim_name ):
	if anim_name == "dead":
		queue_free()
