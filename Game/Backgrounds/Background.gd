extends ParallaxBackground

export (int) var velocity = 100

var offset_y = 0

func _process(delta):
	offset_y += velocity * delta
	set_scroll_offset(Vector2(0, offset_y))
