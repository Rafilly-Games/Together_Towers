extends Node2D

var kill =0
var gold = 700
var vida = 50
var torre_e =0
var torre_e_obj
var linha = load("res://cenas/linha.tscn")
var array = PoolVector2Array()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


 
func _process(_delta):
	if vida <= 0:
		self.set_modulate("ff0000")
		get_node("Canvazao/Game_over").show()
		get_tree().set_pause(true)
		
		
	if Input.is_action_just_pressed("mouse_Rclick"):
		var f =get_tree().get_nodes_in_group("linha")
		for i in f:
			i.hide()
	
	var g = get_node("Canvazao/play-stop").is_pressed()
	if g == true:
		var stops = get_tree().get_nodes_in_group("stopavel")
		for i in stops:
			i.set_process(false)
		var torres = get_tree().get_nodes_in_group("torre")
		for j in torres:
			j.atirar_on = false
	else:
		var stops = get_tree().get_nodes_in_group("stopavel")
		for i in stops:
			i.set_process(true)
		var torres = get_tree().get_nodes_in_group("torre")
		for j in torres:
			j.atirar_on = true
	pass


func linhas():
	var k = get_tree().get_nodes_in_group("linha")
	for i in k:
		i.queue_free()
	var nodes_g = get_tree().get_nodes_in_group("sinergia_group")
	for node in nodes_g:
		var ov_area = node.get_overlapping_areas()
		for are in ov_area:
			if are.is_in_group("sinergia_group")== true:
				var kl = linha.instance()
				var b =are.get_global_position()-node.get_global_position()
				
				array = [
					Vector2(0,0),
					b
				]
				kl.set_points(array)
				kl.hide()
				node.add_child(kl)

func elet_tower():
	var a = get_tree().get_nodes_in_group("raio")
	for i in a:
		if i.raio > torre_e:
			torre_e_obj = i


