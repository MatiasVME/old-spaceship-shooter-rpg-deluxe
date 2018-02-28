extends CanvasLayer

func _physics_process(delta):
	if Main.update_life_board:
		update_life_board()
		Main.update_life_board = false

func update_life_board():
	match Main.lifes:
		0:
			hide_all_lifes()
		1:
			hide_all_lifes()
			$Lifes/Life1.show()
		2:
			hide_all_lifes()
			$Lifes/Life1.show()
			$Lifes/Life2.show()
		3:
			hide_all_lifes()
			$Lifes/Life1.show()
			$Lifes/Life2.show()
			$Lifes/Life3.show()
		4:
			hide_all_lifes()
			$Lifes/Life1.show()
			$Lifes/Life2.show()
			$Lifes/Life3.show()
			$Lifes/Life4.show()
		5:
			hide_all_lifes()
			$Lifes/Life1.show()
			$Lifes/Life2.show()
			$Lifes/Life3.show()
			$Lifes/Life4.show()
			$Lifes/Life5.show()
	
func hide_all_lifes():
	$Lifes/Life1.hide()
	$Lifes/Life2.hide()
	$Lifes/Life3.hide()
	$Lifes/Life4.hide()
	$Lifes/Life5.hide()