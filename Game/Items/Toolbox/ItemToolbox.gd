# ItemToolbox.gd

extends "res://Game/Items/ItemConsumable.gd"

# Cantidad de toolbox que existen
const AMOUNT_TOOLBOX_MAX = 4

enum Toolbox {TOOLBOX_5, TOOLBOX_10, TOOLBOX_15, TOOLBOX_20}
var toolbox

# Cuanto repara el toolbox
var repair_num setget , get_repair_num

func _ready():
	randomize()

# Crea una caja de herramientas según el contexto. Según los parámetros
# player_level, game_level
func create_random_toolbox_according_to_context(player_level, game_level):
	var context_points = int(round((player_level + game_level) * 0.5))
	print("create_random_toolbox_according_to_context:context_points: ", context_points)
	
	match context_points:
		1, 2, 3:
			print("1")
			create_random_toolbox(0, 1)
		4, 5, 6, 7, 8, 9, 10, 11, 12:
			create_random_toolbox(0, 2)

func create_random_toolbox(min_size, max_size):
	if max_size > AMOUNT_TOOLBOX_MAX:
		print("No hay toolbox en esa cantidad")
		return
	
	var rand_toolbox = int(round(rand_range(min_size, max_size)))
	create_toolbox(rand_toolbox)

func create_toolbox(_toolbox):
	match _toolbox:
		Toolbox.TOOLBOX_5:
			describe_toolbox(Toolbox.TOOLBOX_5, 5)
		Toolbox.TOOLBOX_10:
			describe_toolbox(Toolbox.TOOLBOX_10, 10)
		Toolbox.TOOLBOX_15:
			describe_toolbox(Toolbox.TOOLBOX_15, 15)
		Toolbox.TOOLBOX_20:
			describe_toolbox(Toolbox.TOOLBOX_20, 20)
	
func describe_toolbox(_toolbox, _repair_num):
	repair_num = _repair_num
	
	var _item_name
	var _description
	
	match _toolbox:
		Toolbox.TOOLBOX_5:
			_item_name = "Toolbox 5"
			_description = "Repair 5HP when you need"
			self.set_min_level_drop(1)
		Toolbox.TOOLBOX_10:
			_item_name = "Toolbox 10"
			_description = "Repair 10HP when you need"
			self.set_min_level_drop(1)
		Toolbox.TOOLBOX_15:
			_item_name = "Toolbox 15"
			_description = "Repair 15HP when you need"
			self.set_min_level_drop(5)
		Toolbox.TOOLBOX_20:
			_item_name = "Toolbox 20"
			_description = "Repair 20HP when you need"
			self.set_min_level_drop(10)
	
	self.set_item_name(_item_name)
	self.set_description(_description)
	
	var toolbox_texture = preload("res://Game/Items/Toolbox/Image/cogwheels-medium.png")
	self.set_texture(toolbox_texture)
#	print("textura: ", toolbox_texture)
#	print("created: ", get_item_name())
#	var inv = Persistence.get_account_data()["PlayerInventory"]
#	print("Inv: ", inv)

# Setters/Getters
#

func get_serialized():
	var result = .get_serialized()
	
	result["Toolbox"] = toolbox
	result["RepairNum"] = repair_num
	
	return result

func get_repair_num():
	return repair_num