extends Area2D

var fire = preload("res://cenas/stone_ball.tscn")
var teste_sin = preload("res://cenas/sinergia_teste.tscn")
var x =0.7
var colocado
var cd = 0.5
var pode_col = true
var entered=0
var sine =0
var sine_col = 0
var dano_sin = 1
var fogo =1
var raio =1
var agua =1
var vento =1
var nature =1
var terra =1
var enemy_array= []
var atirar_on = true
# Called when the node enters the scene tree for the first time.
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
	if enemy_array.size() >0 && x <=0 :
		atira(enemy_array[0])
		x = 0.7
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
		k.add_to_group("terra")
		self.add_child(k)
		get_node("range").hide()
		get_node("sinergia/sinergia").hide()
#elimina a torre do mouse sem colocar
func displace():
	if colocado == false && Input.is_action_just_pressed("mouse_Rclick"):
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
	dano_sin = 3*fogo*agua*raio*terra*vento*nature
	pass

func atira(body):
	if atirar_on == true :
		var k = fire.instance()
		self.call_deferred("add_child",k)
		k.set_position(Vector2(0,0))
		var ab = body.get_global_position()
		var ba = self.get_global_position()
		var velv = (ab-ba).normalized()
		k.vel = velv*15
		k.dano = dano_sin






func _on_abre_label_button_down():
	get_tree().get_root().get_node("Base/Canvazao/Info_panel/vende_torre").connect("button_press",self,"_on_vende_torre_button_down")
	pass # Replace with function body.



func _on_vende_torre_button_down():
	get_node("sinergia_teste").remove_from_group("sinergia_group")
	get_tree().get_root().get_node("Base").linhas()
	self.queue_free()
	pass # Replace with function body.
