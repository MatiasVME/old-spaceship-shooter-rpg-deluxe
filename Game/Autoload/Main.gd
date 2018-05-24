extends Node

const RES_X = 400
const RES_Y = 640
const VERSION = "v0.1.0"

var music_enable = true
var sound_enable = true
var debug = true

var HUD setget set_hud, get_hud
#var player setget set_player, get_player
var current_account setget set_current_account, get_current_account

# Toda la data
var data = {}
# Player
var player = load("res://addons/RPGElements/Nodes/RPGCharacter.gd").new()
# Stats
var stats = load("res://addons/RPGElements/Nodes/RPGStats.gd").new()

var is_over = false
var current_level = 1
var score = 0 # Borrar
var last_level = 6

var enemies_can_fire = false
var enemies_in_screen = 0

var player_can_move = false
var player_is_dead = false
var player_mark_to_dead = false
var player_is_inmortal = true

# Teclas
var direction = 0
var button_can_fire = false

func _ready():
	if debug:
		player.debug = true
		stats.debug = true
	
	# Generar el player
	
	pass

# Metodos Publicos
#

func save_player_data():
	data["Player"] = player.get_dictionary()
	
func save_stats_data():
	data["Stats"] = stats.get_dictionary()

# Setters/Getters
#

func set_player(_player):
	player = _player
	
func get_player():
	return player
	
func set_hud(_HUD):
	HUD = _HUD
	
func get_hud():
	return HUD
	
func set_current_account(_current_account):
	current_account = _current_account
	
func get_current_account():
	return current_account