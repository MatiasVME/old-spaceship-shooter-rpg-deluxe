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
	
	$Anim.play("drop")
	
func impulse():
	var rand_x = rand_range(-200, 200)
	var rand_y = rand_range(-200, 200)
	
	$Body.apply_impulse(Vector2(0, 0), Vector2(rand_x, rand_y))

func create_random_toolbox(max_size):
	if max_size > AMOUNT_TOOLBOX_MAX:
		print("No hay toolbox en esa cantidad")
		return
	
	var rand_toolbox = int(round(rand_range(0, max_size)))
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
	
	var toolbox_texture = preload("res://Game/Items/Toolbox/Image/cogwheels.png")
	self.set_texture(toolbox_texture)

# Setters/Getters
#

func get_repair_num():
	return repair_num

# Signals Functions
#

func _on_AreaConsume_body_entered(body):
	if body.is_in_group("Player") and $Anim.assigned_animation != "consume":
		$Anim.play("consume")
		print("consume")

func _on_Anim_animation_finished(anim_name):
	if anim_name == "drop":
		pass
	elif anim_name == "consume":
		SoundManager.select_sound(SoundManager.CONSUME_LIFE)
		SoundManager.play_sound()
		
#		else:
#			SoundManager.select_sound(SoundManager.NOPE)
#			SoundManager.play_sound()
		print("queue_free")
		queue_free()
