extends CanvasLayer

func _ready():
	Main.set_hud(self)

func _on_Left_button_down():
	Main.direction = -1

func _on_Right_button_down():
	Main.direction = 1

func _on_Right_button_up():
	Main.direction = 0

func _on_Left_button_up():
	Main.direction = 0

func _on_Fire_toggled(pressed):
	if pressed:
		Main.button_can_fire = true
	else:
		Main.button_can_fire = false
