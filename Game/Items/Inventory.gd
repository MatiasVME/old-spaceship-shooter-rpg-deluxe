# Inventory.gd

export (Array) var inventory = [] setget , get_inv

func add_item_in_inventory(item):
	inventory.append(item)

func remove_item_in_inventory(item_name):
	if inventory.size() < 0:
		print("El inventario esta vacio")
		return
	
	for i in range(inventory.size()):
		if inventory[i].item_name == item_name:
			inventory.remove(i)

# Setters/Getters
#

func get_serialized():
	var result = []
	
	for i in range(inventory.size()):
		result.append(inventory[i].get_serialized())
	
	return result

func set_serialized(dict):
	# Transformar diccionario a objeto
	pass

func get_inv():
	return inventory