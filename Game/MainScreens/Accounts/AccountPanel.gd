extends NinePatchRect

enum State {LAYER1, LAYER2, LAYER3, LAYER4}
var state = State.LAYER1
var old_state = null

var total_accounts
var account_number

# One time
var ot_layer1 = true
var ot_layer2 = true
var ot_layer3 = true
var ot_layer4 = true

func _process(delta):
	match state:
		State.LAYER1:
			# Cuando see preciona cancelar en el layer2
			if old_state == State.LAYER2 and ot_layer1:
				reset_ot_layers()
				$Anim.play("hide_layer2")
				ot_layer1 = false
			# Cuando aparece por primera vez
			elif $Anim.assigned_animation != "hide_layer1" and old_state == null:
				reset_ot_layers()
				$Anim.play_backwards("hide_layer1")
				ot_layer2 = true
			# Cuando se borra una cuenta
			elif old_state == State.LAYER4 and ot_layer1:
				reset_ot_layers()
				ot_layer1 = false
				$Anim.play("hide_layer4")
		State.LAYER2:
			if ot_layer2:
				reset_ot_layers()
				$Anim.play("hide_layer1")
				ot_layer2 = false
		State.LAYER3:
			if ot_layer3 and old_state == State.LAYER4:
				reset_ot_layers()
				ot_layer3 = false
				$Anim.play("hide_layer4")
			elif ot_layer3 and old_state == State.LAYER1:
				reset_ot_layers()
				ot_layer3 = false
				$Anim.play_backwards("hide_layer3")
			elif ot_layer3:
				reset_ot_layers()
				ot_layer3 = false
				$Anim.play("hide_layer2")
		State.LAYER4:
			if ot_layer4:
				reset_ot_layers()
				ot_layer4 = false
				$Anim.play("hide_layer3")

func show_account(account):
	$Layer3/Name.text = account
	
	old_state = State.LAYER1
	state = State.LAYER3

func reset_ot_layers():
	ot_layer1 = true
	ot_layer2 = true
	ot_layer3 = true
	ot_layer4 = true

func _on_Anim_animation_finished(anim_name):
	if anim_name == "hide_layer1" and state == State.LAYER2:
		$Anim.play_backwards("hide_layer2")
	elif anim_name == "hide_layer2" and state == State.LAYER1:
		$Anim.play_backwards("hide_layer1")
	elif anim_name == "hide_layer2" and state == State.LAYER3:
		$Anim.play_backwards("hide_layer3")
	elif anim_name == "hide_layer3" and state == State.LAYER4:
		$Anim.play_backwards("hide_layer4")
	elif anim_name == "hide_layer4" and state == State.LAYER1:
		$Anim.play_backwards("hide_layer1")
	elif anim_name == "hide_layer4" and state == State.LAYER3:
		$Anim.play_backwards("hide_layer3")

func _on_OK_create_new_account_pressed():
	# Crear cuenta
	
	# TODO: Falta validar bien el nombre
	
	Persistence.load_accounts()
	
	if Persistence.create_account($Layer2/LineEdit.text):
		old_state = State.LAYER2
		state = State.LAYER3
		Persistence.save_accounts()
		
		$Layer3/Name.text = $Layer2/LineEdit.text

func _on_Cancel_create_new_account_pressed():
	old_state = State.LAYER2
	state = State.LAYER1

func _on_Create_create_new_account_pressed():
	old_state = State.LAYER1
	state = State.LAYER2

func _on_Delete_select_account_pressed():
	# Preparar para eliminar la cuenta
	old_state = State.LAYER3
	state = State.LAYER4

func _on_OK_select_account_pressed():
	# Establecer la cuenta con la que se va a jugar.
	print("$Layer3/Name.text: ", $Layer3/Name.text)
	Main.set_current_account($Layer3/Name.text)
	
	# Pasar a la pantalla de LevelMode.
	get_tree().change_scene("res://Game/MainScreens/ShowProfile.tscn")

func _on_ConfirmDelete_pressed():
	# Confirmar eliminar cuenta
	
	if Persistence.delete_account($Layer3/Name.text):
		$Layer2/LineEdit.text = ""
		old_state = State.LAYER4
		state = State.LAYER1

func _on_NoDelete_pressed():
	old_state = State.LAYER4
	state = State.LAYER3


func _on_OK_pressed():
	pass # replace with function body
