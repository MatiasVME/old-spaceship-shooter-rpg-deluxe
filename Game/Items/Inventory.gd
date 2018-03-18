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
		
func get_inv():
	return inventory