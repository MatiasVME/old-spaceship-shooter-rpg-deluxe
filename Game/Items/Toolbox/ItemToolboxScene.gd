# ItemToolboxScene.gd

extends Node2D

var item_toolbox = load("res://Game/Items/Toolbox/ItemToolbox.gd").new() setget , get_item_toolbox

func _ready():
	Persistence.load_alternative_data()
	
	var player_level = Persistence.get_account_data()["PlayerStats"].level
	var game_level = Main.current_level
	
	item_toolbox.create_random_toolbox_according_to_context(player_level, game_level)
	
func get_item_toolbox():
	return item_toolbox