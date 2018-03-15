extends Node

func _ready():
	randomize()

func generate_first_items():
	var amount
	
	# Obtener el inventario
	var player_inventory = Persistence.get_account_data()["PlayerInventory"]
	
	# Generar de 1 a 3 toolbox
	amount = int(round(rand_range(1, 3)))
	
	for i in range(amount):
		var toolbox = load("res://Game/Items/Toolbox/ItemToolbox.gd").new()
		var max_size = round(rand_range(0, 1))
		toolbox.create_random_toolbox(max_size)
		player_inventory.add_item_in_inventory(toolbox)
		print(player_inventory)
	
	# Generar de 1 a 2 energy
	
	# Generar de 5 a 25 coins
	
	
func generate_random_item(level):
	pass