extends RigidBody2D

export (int) var max_life = 6
export (int) var min_life = 3

export (int) var score_value = 5
export (int) var xp_value = 1

export (float) var max_wait_time = 1
export (float) var min_wait_time = 3

export (int) var one_of_each = 30

func _ready():
	randomize()

func drop_life_if_can():
	var prob = rand_range(1, one_of_each)
	
	if prob < 2:
		var rec_life = load("res://Game/Actors/PowerUps/Live/Life.tscn")
		var life = rec_life.instance()
		
		life.global_position = self.global_position
		
		get_parent().add_child(life)
		life.impulse()