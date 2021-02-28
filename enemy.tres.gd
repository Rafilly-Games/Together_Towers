extends PathFollow2D

var preco = 5
var life = 1
var teste =0
var float_t = load("res://cenas/float_text.tscn")

var raio_e = preload("res://cenas/raio_ball.tscn")
var vel = Vector2(0,3)
var vida = 1
var vida_max
var fire_time = 0
var fire_burn =0
var burning = false

var velo = 300
var velo_base = 300
var wet =0
var poison_time =0
var poison_hit =0
var poisoned
var ventado = false
var eletro = false
var dano

var stun_cd=0
var stun_time=0
var stuni = 1

func _ready():
	pass

func _process(delta):
	#muda_tam()
	if fire_time > 0:
		fire_time -= delta
	if burning == true && fire_time <=0:
		var ui = float_t.instance()
		ui.texf(fire_burn)
		ui.modulate = Color(255,0,0,255)
		add_child(ui)
		vida-=fire_burn
		fire_time = 2
	
	if poison_time > 0:
		poison_time -= delta
	if poisoned == true && poison_time <=0:
		var ui = float_t.instance()
		ui.texf(poison_hit)
		ui.modulate = Color(0,255,0,255)
		add_child(ui)
		vida-=poison_hit
		poison_time = 2
	
	if wet >0:
		wet-=delta
	if wet <0:
		velo =velo_base
	
	if stun_cd >0:
		stun_cd-=delta
	if stun_time >0:
		stun_time-=delta
	
	if stun_time <=0:
		stuni = 1
	
	
	if vida <= 0:
		if eletro== true:
			eletri(Vector2(0,1),dano)
			eletri(Vector2(0,-1),dano)
			eletri(Vector2(1,1),dano)
			eletri(Vector2(1,0),dano)
			eletri(Vector2(1,-1),dano)
			eletri(Vector2(-1,1),dano)
			eletri(Vector2(-1,0),dano)
			eletri(Vector2(-1,-1),dano)
		get_tree().get_root().get_node("Base").gold += preco
		get_tree().get_root().get_node("Base").kill +=1
		queue_free()
		get_tree().get_root().get_node("Base/Dead")._set_playing(true)
		
	
	
	self.set_offset(self.get_offset()+stuni*velo*delta)
	if get_offset() >= 6300:
		get_tree().get_root().get_node("Base").vida -= life
		queue_free()
	pass


func perde_vida(x,_y):
	if vida > 0:
		var ui = float_t.instance()
		ui.texf(x)
		ui.modulate = Color(150,150,150,255)
		add_child(ui)
		vida-=x
		get_tree().get_root().get_node("Base/hit_norm")._set_playing(true)



func status(x,y):
	if x ==0:
		#fogo
		burning = true
		queimando(y)
		if fire_time <= 0:
			fire_time = 1
		pass
	if x ==1:
		if stun_cd <=0:
			stuni = 0
			stun_time = 2
			stun_cd = 5
		#terra
		pass
	if x ==2:
		eletro = true
		dano = y
		pass
	if x ==3:
		poison(y)
		poisoned = true
		#nature
		pass
	if x ==4:
		if velo > velo_base/3:
			velo = velo*0.75
		wet = 3
		#agua
		pass
	if x ==5:
		if ventado == false:
			set_offset(0)
		ventado =true
		#vento
		pass

func queimando(x):
	fire_burn+=x
	
func poison(x):
	poison_hit += x/4
	if poison_time <= 0:
		poison_time = 1

func eletri(fel,danoy):
	teste+=1
	var h =raio_e.instance()
	h.vel = fel*15
	h.set_global_position(get_global_position()+fel)
	h.dano = danoy
	h.chamado = true
	get_tree().get_root().add_child(h)
	pass
	

		
