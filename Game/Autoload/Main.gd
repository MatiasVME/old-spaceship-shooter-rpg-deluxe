extends Node

const RES_X = 1280
const RES_Y = 720

var music_enable = false
var sound_enable = false
var debug = false

var HUD setget set_hud, get_hud
var player setget set_player, get_player
var current_account setget set_current_account, get_current_account

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
var lifes = 3

var update_life_board = false

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
