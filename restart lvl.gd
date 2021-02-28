extends TextureButton


var a
var b
var c
var d
var gold
var vida
# Called when the node enters the scene tree for the first time.
func _ready():
	lvl_end()
	pass # Replace with function body.

func lvl_end():
	a = get_tree().get_nodes_in_group("torre")
	gold = get_tree().get_root().get_node("Base").gold
	vida = get_tree().get_root().get_node("Base").vida

func restart():
	get_parent().get_node("play-stop").pressed = true
	get_tree().get_root().get_node("Base").gold = gold
	get_tree().get_root().get_node("Base").vida = vida
	d = get_tree().get_nodes_in_group(("deletavel"))
	for i in d:
		i.queue_free()	
	c = get_tree().get_nodes_in_group(("enemy"))
	for i in c:
		i.queue_free()
	b = get_tree().get_nodes_in_group("torre")
	for i in b:
		if a.find(i) == -1:
			i.queue_free()
	get_tree().get_root().get_node("Base").linhas()
	get_tree().get_root().get_node("Base/Spawner").wave_set()
