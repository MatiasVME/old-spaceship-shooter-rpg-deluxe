extends "../Bullet.gd"

export (bool) var is_colorful = false

func _ready():
	apply_impulse(Vector2(0,0), Vector2(0, -600))
	
	if is_colorful:
		randomize()
		random_texture()

func random_texture():
	var texture_num = int(rand_range(1, 4) - 0.001)
	var rec_texture = load(str("res://Game/Actors/Bullets/Lasers/Laser-", str(texture_num),".png"))
	$Image.texture = rec_texture

func _on_Live_timeout():
	$Anim.play("dead")

func _on_VisibilityNotifier2D_screen_entered():
	$Anim.play("start")

func _on_Anim_animation_finished( anim_name ):
	if anim_name == "dead":
		queue_free()
