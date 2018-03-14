# ItemToolbox.gd

extends "../ItemConsumable.gd"

enum Toolbox {TOOLBOX_5, TOOLBOX_10, TOOLBOX_15, TOOLBOX_20}
var toolbox

# Cuanto repara el toolbox
var repair_num setget , get_repair_num

func _ready():
	randomize()
	
func impulse():
	var rand_x = rand_range(-200, 200)
	var rand_y = rand_range(-200, 200)
	
	$Body.apply_impulse(Vector2(0, 0), Vector2(rand_x, rand_y))

func create_toolbox(Toolbox):
	match Toolbox:
		Toolbox.TOOLBOX_5:
			describe_toolbox(Toolbox.TOOLBOX_5, 5)
		Toolbox.TOOLBOX_10:
			describe_toolbox(Toolbox.TOOLBOX_10, 10)
		Toolbox.TOOLBOX_15:
			describe_toolbox(Toolbox.TOOLBOX_15, 15)
		Toolbox.TOOLBOX_20:
			describe_toolbox(Toolbox.TOOLBOX_20, 20)
			
func describe_toolbox(Toolbox, _repair_num):
	repair_num = _repair_num
	
	var _item_name
	var _description
	
	match Toolbox:
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
	self.set_texture($Image.texture)

# Setters/Getters
#

func get_repair_num():
	return repair_num