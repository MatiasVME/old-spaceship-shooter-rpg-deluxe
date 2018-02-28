extends RigidBody2D

func _ready():
	SoundManager.select_sound(SoundManager.DROP)
	SoundManager.play_sound()

func impulse():
	var rand_x = rand_range(-200, 200)
	var rand_y = rand_range(-200, 200)
	
	apply_impulse(Vector2(0, 0), Vector2(rand_x, rand_y))

func _on_Anim_animation_finished( anim_name ):
	if anim_name == "drop":
		$Anim.play("idle")
	elif anim_name == "consume":
		if Main.lifes < 5:
			Main.lifes += 1
			Main.update_life_board = true
		
			SoundManager.select_sound(SoundManager.CONSUME_LIFE)
			SoundManager.play_sound()
		else:
			SoundManager.select_sound(SoundManager.NOPE)
			SoundManager.play_sound()
		
		queue_free()

func _on_Area_body_entered( body ):
	if body.is_in_group("Player") and $Anim.assigned_animation != "consume":
		$Anim.play("consume")
