extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cena = load("res://cenas/cena_teste_spawn e torre.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_new_game_button_down():
	var k = get_tree().change_scene_to(cena)
	
	if k != OK:
		print ("erro de load na cena do botão novo jogo")
	else:
		pass
	pass # Replace with function body.


func _on_exit_button_down():
	get_tree().quit()
	pass # Replace with function body.


func _on_about_button_down():
	pass # Replace with function body.


func _on_howtoplay_button_down():
	get_parent().get_parent().get_node("TextureRect").show()
	pass # Replace with function body.


func _on_return_button_down():
	get_parent().get_parent().get_node("TextureRect").hide()
	pass # Replace with function body.
