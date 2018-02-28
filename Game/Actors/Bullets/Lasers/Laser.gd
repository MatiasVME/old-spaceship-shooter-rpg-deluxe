extends "../Bullet.gd"

export (bool) var is_colorful = false

func _ready():
	bullet_owner = BulletOwner.PLAYER
	
	if is_colorful:
		randomize()
		random_texture()
	
	normal_impulse()

func random_texture():
	var texture_num = int(rand_range(1, 4) - 0.001)
	var rec_texture = load(str("res://Game/Actors/Bullets/Lasers/Laser-", str(texture_num),".png"))
	$Image.texture = rec_texture

func _on_Live_timeout():
	$Anim.play("dead")

func _on_Anim_animation_finished( anim_name ):
	if anim_name == "dead":
		queue_free()
