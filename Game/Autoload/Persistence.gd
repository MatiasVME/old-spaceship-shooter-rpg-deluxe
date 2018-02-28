extends Node

const PATH = "user://data.dat"
const PASS = "123"

var is_loaded = false

var data
	
func _ready():
	reset_data()
	load_or_create()

func load_or_create():
	var file = File.new()
	
	if file.file_exists(PATH):
		load_data()
	else:
		save_data()
		load_data()

func save_data():
	var file = File.new()
	
	file.open_encrypted_with_pass(PATH, File.WRITE, PASS)
	file.store_var(data)
	file.close()
	
	is_loaded = false

func load_data():
	if is_loaded:
		return
	
	var file = File.new()
	
	file.open_encrypted_with_pass(PATH, File.READ, PASS)
	data = file.get_var()
	file.close()
	
	is_loaded = true

func reset_data():
	data = {
		"Score" : 0,
		Time = {
			0 : 0
		}
	}

func reset_file():
	var file = Directory.new()
	
	if file.file_exists(PATH):
		file.remove(PATH)
		
	load_or_create()