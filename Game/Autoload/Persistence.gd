# Persistence.gd

extends Node

# Sólo es un password temporal
var temporal_password = "y~mu_L!6$qq9o119y1W("

const ACCOUNTS_NAME_PATH = "user://accounts.bin"
var accounts = [] setget , get_accounts

var account_is_loaded = false

func _ready():
	var accounts_file_data = File.new()
	
	if accounts_file_data.file_exists(ACCOUNTS_NAME_PATH):
		load_accounts()
	else:
		save_accounts()
		load_accounts()
		
	# Test
#	test()
	
func test():
	load_accounts()
	create_account("Test")
	create_account("Hola")
	save_accounts()

func save_accounts():
	account_is_loaded = false
	
	var file = File.new()
	
	if not Main.debug:
		file.open_encrypted_with_pass(ACCOUNTS_NAME_PATH, 
				File.WRITE, temporal_password)
		file.store_var(accounts)
	else:
		file.open(ACCOUNTS_NAME_PATH, File.WRITE)
		file.store_var(to_json(accounts))
	
	file.close()

func load_accounts():
	if not account_is_loaded:
		account_is_loaded = true
		print("account_is_loaded")
	else:
		print("return")
		return
	
	var file = File.new()
	
	if not Main.debug:
		file.open_encrypted_with_pass(ACCOUNTS_NAME_PATH, 
				File.READ, temporal_password)
		accounts = file.get_var()
	else:
		file.open(ACCOUNTS_NAME_PATH, File.READ)
		accounts = parse_json(file.get_var())
	
	file.close()
	
	if Main.debug: print("accounts: ", accounts)
	
	if accounts.size() >= 1:
		for account in accounts:
			print(account)

func create_account(name):
	if create_new_data(name):
		accounts.append(name)
		return true
	
	return false

# Crea la nueva data y la guarda
func create_new_data(account_name):
	var file = File.new()
	var path = "user://" + account_name + ".bin"
	
	if file.file_exists(path):
		if Main.debug: print("El archivo ", path, " ya existe")
		return false
	
	var data_account = create_data_account(account_name)
	
	if account_name != "accounts":
		var err = file.open_encrypted_with_pass(path, 
			File.WRITE, temporal_password)
		file.store_var(data_account)
		file.close()
		
		return true
	else:
		if Main.debug: print("account_name no puede llamarse: ", account_name)
		return false

func create_data_account(owner):
	var data_account = {
		Owner = owner,
		Stats = null
	}
	
	return data_account

func delete_account(name):
	if not accounts.has(name):
		if Main.debug: print("No se encuentra %s para ser borrado" % name)
		return
	
	delete_account_data(name)
	
	accounts.remove(accounts.find(name))
	save_accounts()
	
func delete_account_data(name):
	var directory = Directory.new()
	var path = "user://" + name + ".bin"
	
	if not directory.file_exists(path):
		if Main.debug: print("No se puede eliminar ", name, " ya que no existe el path: ", path)
		return

	var err = directory.remove(path)
	
# Setters/Getters
#

func get_accounts():
	return accounts

# Este método es para obtener la data de una cuenta en específico
# para uso mas recurrente es mejor utilizar get_recurrent_account_data.
# Pero si se desea saber la data de otras cuentas se puede utilizar
# este método.
func get_account_data(account_name):
	var file = File.new()
	var path = "user://" + account_name + ".bin"
	
	if file.file_exists(path):
		var err = file.open_encrypted_with_pass(path, 
				File.READ, temporal_password)
		var account_data = file.get_var()
		file.close()
		
		return account_data
		
#func get_recurrent_account_data():
#	return account_data