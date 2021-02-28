extends Node2D

var principal = true
var wave=1

var wave_number
#number of waves
var normal_number =3
var armored_number =0
var fly_number = 0
var a = preload("res://cenas/enemy.tscn")
var b = preload("res://cenas/enemy_armored.tscn")
var c = load("res://cenas/enemy_fly.tscn")
var inimigo_normal = 1
var inimigo_armor = 2
var inimigo_fly = 1.5
var ghj = 0
var ghj_2 =0
var ghj_3 = 0
var ghj_norm=14
var ghj_fly=2
var ghj_arm=5
var lag =0
var auto_start = false

# Called when the node enters the scene tree for the first time.
func _ready():
	wave_set()
	pass # Replace with function body.

func wave_set():
	normal_number =3 + wave / 12
	if wave > 2:
		armored_number =2 + wave / 11
	if wave > 4:
		fly_number = 1 + wave/10
	get_parent().get_node("Canvazao/restart lvl").lvl_end()
	ghj_norm = 15 + wave/2
	ghj_arm = 4 + wave/2
	ghj_fly =  3 + wave
	


func check_wave():
	var f = get_tree().get_nodes_in_group("enemy")
	if f.empty() == true:
		var g =get_tree().get_nodes_in_group("bullet")
		for i in g:
			i.queue_free()
		if principal == true && auto_start == false:
			get_tree().get_root().get_node("Base/Canvazao/play-stop").set_pressed(true)
		wave+=1
		inimigo_normal=0.3
		inimigo_armor =0.7
		inimigo_fly = 0.6
		#get_tree().get_root().get_node("Base").gold += 100 + wave*5
		wave_set()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	wave_number = normal_number + armored_number + fly_number
	if wave_number <= 0:
		check_wave()
	if wave_number >0:
		inimigo_normal-=delta
		inimigo_armor -=delta
		inimigo_fly -= delta
		if inimigo_normal <0 && normal_number >0:
			
			var k = a.instance()
			k.vida = 50 + ((wave-1)*600) +get_tree().get_root().get_node("Base").kill*wave
			k.vida_max = 50 + ((wave-1)*600)+get_tree().get_root().get_node("Base").kill*wave
			get_parent().get_node("Path2D").add_child(k)
			k.set_offset(0)
			inimigo_normal=0.2
			ghj +=1
			if ghj > ghj_norm:
				inimigo_normal = 1
				ghj = 0
				normal_number -=1
		if inimigo_armor <0 && armored_number>0:
			
			var k = b.instance()
			k.vida =150 + (wave*1000)+get_tree().get_root().get_node("Base").kill*wave
			k.vida_max = 150 + (wave*1000)+get_tree().get_root().get_node("Base").kill*wave
			k.armor = (wave-2)*150
			get_parent().get_node("Path2D").add_child(k)
			k.set_offset(0)
			inimigo_armor=0.2
			ghj_2 +=1
			if ghj_2 > ghj_arm:
				armored_number -=1
				inimigo_armor = 1
				ghj_2 = 0
		
		if inimigo_fly <0 && fly_number>0:
			var k = c.instance()
			k.vida =150 + (wave-2)*450+get_tree().get_root().get_node("Base").kill*wave
			k.vida_max = 150 + ((wave-2)*450)+get_tree().get_root().get_node("Base").kill*wave
			k.armor = 20 + (wave-4)*20
			get_parent().get_node("Path2D").add_child(k)
			k.set_offset(0)
			inimigo_fly=0.2
			ghj_3 +=1
			if ghj_3 > ghj_fly:
				fly_number -=1
				inimigo_fly = 1
				ghj_3 = 0
	
	pass
