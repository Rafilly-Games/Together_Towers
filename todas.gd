extends Area2D

var preco = [
	100,#fogo
	150,#terra
	100,#eletric
	250,#nature
	250,#agua
	400#vento
	
]
var fire
var teste_sin = preload("res://cenas/sinergia_teste.tscn")
var colocado
var cd = 0.5
var pode_col = true
var entered=0
var sine =0
var dano_sin = 1
var fogo =1
var raio =1
var agua =1
var vento =1
var nature =1
var terra =1
var enemy_array= []
var atirar_on = true

var valor=0
#array com nome base
var array_principal= [
	"fogo",
	"terra",
	"raio"
]
var cd_torre = [
	0.2,
	0.3,
	0.1
]
var dano_sin_a =[
	2,
	1,
	1
]
var x:float
func atualiza_tudo():
	fire = load("res://cenas/"+array_principal[valor]+"_ball.tscn")
	var g = load("res://pngs/"+array_principal[valor]+"/"+array_principal[valor]+"_t.png")
	get_node("abre_label/Sprite").set_texture(g)


func _init():
	colocado = false

func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sinergia()
	displace()
	modulatera()
	if enemy_array.size() >0 && x <0 :
		if valor == 0 || valor == 2:
			if enemy_array[0] != null:
				atira(enemy_array[0])
		if valor == 1:
			atira_todos()
		x = cd_torre[valor]
	if cd >0:
		cd -= delta
	if cd <=0 && pode_col == true:
		place()
	if colocado == false:
		set_global_position(get_global_mouse_position())
	x -=delta
	pass

#dispara quando inimigo entra
func _on_fogo_t_body_entered(body):
	if body.is_in_group("enemy") && colocado == true:
		if valor == 2:
			if body.is_in_group("fly"):
				pass
			else:
				enemy_array.append(body)
		else:
			enemy_array.append(body)

func _on_fogo_t_body_exited(body):
	if body.is_in_group("enemy") && colocado == true:
		enemy_array.erase(body)
	pass # Replace with function body.

#coloca a torre no chão
func place():
	if Input.is_action_just_pressed("mouse_lclick") && pode_col == true && colocado == false:
		colocado = true
		var k = teste_sin.instance()
		k.add_to_group(array_principal[valor])
		self.add_child(k)
		get_node("range").hide()
		get_node("sinergia/sinergia").hide()
		
#elimina a torre do mouse sem colocar
func displace():
	if colocado == false && Input.is_action_just_pressed("mouse_Rclick"):
		get_tree().get_root().get_node("Base").gold += preco[valor]
		self.queue_free()

func displace_but():
	if colocado == false:
		get_tree().get_root().get_node("Base").gold += preco[valor]
		self.queue_free()

#mede se pode ou não colocar
func _on_luygar_area_entered(area):
	if area.is_in_group("torre_c"):
		entered+=1
	
	pass # Replace with function body.
func _on_luygar_area_exited(area):
	if area.is_in_group("torre_c"):
		entered -=1
	
	pass # Replace with function body.
#mede se esta na area de sinergia
func _on_sinergia_area_entered(_area):
	sine +=1
	
	pass # Replace with function body.
func _on_sinergia_area_exited(_area):
	sine-=1
	
	pass # Replace with function body.

#altera modulate pra colocar e sinergia
func modulatera():
	if entered <=0:
		pode_col = true
	if colocado == true:
		self.set_modulate("ffffff")
	elif entered <=0 && sine <=0:
		self.set_modulate("ffffff")
		pode_col = true
	elif entered >0 && colocado == false:
		self.set_modulate("ff0000")
		pode_col = false
	elif sine>0 && colocado == false:
		self.set_modulate("fffb05")
	
func sinergia():
	dano_sin = dano_sin_a[valor]*fogo*agua*raio*terra*vento*nature
	pass

func _on_abre_label_button_down():
	get_tree().get_root().get_node("Base/Canvazao/Info_panel/Label").textao(fogo,agua,terra,vento,raio,nature,dano_sin,dano_sin_a[valor])
	get_tree().get_root().get_node("Base/Canvazao/Info_panel/vende_torre").node = self
	var fg = get_tree().get_nodes_in_group("linha")
	for i in fg:
		i.hide()
	if colocado == true:
		var ch =get_node("sinergia_teste").get_children()
		for i in ch:
			if i.is_in_group("linha"):
				i.show()
	pass # Replace with function body.

func tex():
	get_tree().get_root().get_node("Base/Canvazao/Info_panel/Label").textao(fogo,agua,terra,vento,raio,nature,dano_sin,dano_sin_a[valor])

func _on_vende_torre_button_down():
	get_tree().get_root().get_node("Base").gold += preco[valor]
	get_node("sinergia_teste").remove_from_group("sinergia_group")
	get_tree().get_root().get_node("Base").linhas()
	self.queue_free()
	pass # Replace with function body.

func atira(body):
	if atirar_on == true :
		var kl = fire.instance()
		body.add_child(kl)
		kl.set_position(Vector2(0,0))
		kl.enemy(body)
		kl.set_global_position(get_global_position())
		kl.dano = dano_sin
		x=cd_torre[valor]
		kl.valor = valor


func atira_todos():
	if atirar_on == true :
		
		var j = get_overlapping_bodies()
		for i in j:
			if i != null:
				if i.is_in_group("enemy"):
					var kl = fire.instance()
					kl.enemy(i)
					i.add_child(kl)
					kl.set_global_position(get_global_position())
					kl.dano = dano_sin
					x=cd_torre[valor]
					kl.valor = valor


func bullet_left(body):
	if body.is_in_group("bullet") == true:
		body.queue_free()

