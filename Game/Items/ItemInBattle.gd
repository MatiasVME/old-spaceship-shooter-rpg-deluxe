extends RigidBody2D

func _ready():
	randomize()
	
	$Anim.play("drop")
	
func impulse():
	var rand_x = rand_range(-200, 200)
	var rand_y = rand_range(-200, 200)
	
	apply_impulse(Vector2(0, 0), Vector2(rand_x, rand_y))

# Signals Functions
#

func _on_AreaConsume_body_entered(body):
	if body.is_in_group("Player") and $Anim.assigned_animation != "consume":
		$Anim.play("consume")

func _on_Anim_animation_finished(anim_name):
	if anim_name == "drop":
		pass
	elif anim_name == "consume":
		SoundManager.select_sound(SoundManager.CONSUME_LIFE)
		SoundManager.play_sound()
		
#		else:
#			SoundManager.select_sound(SoundManager.NOPE)
#			SoundManager.play_sound()
		queue_free()