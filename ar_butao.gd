extends TextureButton

var preco = 300
var fogo = load("res://cenas/vento_t.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label").set_text(str(preco))


func _process(_delta):
	if preco > get_tree().get_root().get_node("Base").gold:
		set_disabled(true)
	else:
		set_disabled(false)
	pass


func _on_ar_button_down():
	get_tree().get_root().get_node("Base").gold -= preco
	var j = get_tree().get_nodes_in_group("torre")
	for i in j:
		i.displace_but()
	var k = fogo.instance()
	k.set_global_position(get_global_mouse_position())
	k.valor =5
	k.atualiza_tudo()
	get_tree().get_root().get_node("Base/torres").add_child(k)
	pass # Replace with function body.
