extends TextureButton


var cena =  load ("res://cenas/cena de entrada.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_menu_button_down():
	get_tree().set_pause(true)
	get_node("TextureRect").show()
	pass # Replace with function body.
func _on_main_menu_button_down():
	var k = get_tree().change_scene_to(cena)
	get_tree().set_pause(false)
	if k != OK:
		print ("erro de load na cena do botão novo jogo")
	else:
		print("haha")
	pass # Replace with function body.
func _on_return_button_down():
	get_node("TextureRect").hide()
	get_tree().set_pause(false)
	pass # Replace with function body.
func _on_exit_game_button_down():
	get_tree().quit()
	pass # Replace with function body.


func _on_CheckBox_toggled(button_pressed):
	if button_pressed == true:
		get_tree().get_root().get_node("Base/Spawner").auto_start = true
	if button_pressed == false:
		get_tree().get_root().get_node("Base/Spawner").auto_start = false
	pass # Replace with function body.
