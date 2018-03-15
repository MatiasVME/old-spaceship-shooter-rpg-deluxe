extends "../EnemyShip.gd"

var rec_bullet = load("res://Game/Actors/Bullets/EnemyBullet/EnemyBullet.tscn")

enum Size {SIZE_1, SIZE_2, SIZE_3}
var size = SIZE_1

func _ready():
	spawn_y = global_position.y
	
	limit_right = $LimitRight.global_position.x
	limit_left = $LimitLeft.global_position.x
	
	randomize()
	
	# Vida de la nave enemiga
	life = round(rand_range(min_life, max_life))
	
	random_texture()
	
	$Anim.play("show")
	
	$TimeToFire.wait_time = rand_range(5, 10)
	$TimeToFire.start()
	
func _physics_process(delta):
	adjust_increment_x()
	movement_x()
	movement_y()

func set_sprite_size(size):
	match size:
		Size.SIZE_1:
			$AnimSize.interpolate_property($Image, "scale", $Image.scale, Vector2(0.5, 0.5), 0.3, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			$AnimSize.start()
		Size.SIZE_2:
			$AnimSize.interpolate_property($Image, "scale", $Image.scale, Vector2(0.6, 0.6), 0.3, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			$AnimSize.start()
		Size.SIZE_3:
			$AnimSize.interpolate_property($Image, "scale", $Image.scale, Vector2(0.7, 0.7), 0.3, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
			$AnimSize.start()

func random_texture():
	var texture_num = int(rand_range(1, 5) - 0.001)
	var rec_texture = load(str("res://Game/Actors/Enemies/BadShip/BadShip-Skin-", str(texture_num),".png"))
	$Image.texture = rec_texture

func _on_BadShip_body_entered( body ):
	if body.is_in_group("Bullet"):
		$Anim.play("damage")
		life -= 1
		
		SoundManager.select_sound(int(rand_range(1,3) - 0.1))
		SoundManager.play_sound()
		
		if life <= 0 and $Anim.assigned_animation != "dead":
			mark_to_dead = true
			$TimeToDead.start()
			$Anim.play("dead")

func _on_TimeToDead_timeout():
	# Cuando muere completamente
	drop_item_if_can()
	
	queue_free()

func _on_TimeToFire_timeout():
	if not Main.enemies_can_fire:
		return
	
	$TimeToFire.wait_time = rand_range(1, 8)
	
	var bullet = rec_bullet.instance()
	var dest = $Image.global_position
	dest.y *= 2
	var direction = (dest - $Image.global_position).normalized()
	bullet.set_direction(direction.rotated(rotation))
	
	bullet.global_position.y = $Image.global_position.y
	bullet.global_position.x = $Image.global_position.x
	get_parent().add_child(bullet)


func _on_Anim_animation_finished(anim_name):
	if anim_name == "show":
		set_sprite_size(int(round(rand_range(0, 3)))) # Need fix
		print("size: ", size)
