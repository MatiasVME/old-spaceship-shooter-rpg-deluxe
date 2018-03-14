extends Node

var stage_level = 1
var dificulty = 0 # Por el momento 0
var player_level

func _ready():
	player_level = Persistence.get_account_data().level
	
	# dificulty | stage_level | player_level
	$LevelGenerator.get_level(dificulty, stage_level, player_level)

	# Test:
#	$LevelGenerator.get_level(3, 6, 20)