extends KinematicBody2D

var chamado = false
var valor
var vel
var pos
var dano
var node
var x
var y
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	pass # Replace with function body.

func enemy(body):
	if body != null:
		node = body
		set_process(true)
	else:
		queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func node_check():
	if node == null:
		queue_free()

func _process(_delta):
	pos = get_global_position()
	
	if chamado == true:
		var a = move_and_collide(vel)
		if a != null:
			var b = a.get_collider()
			if b.is_in_group("enemy"):
				b.get_parent().perde_vida(dano,valor)
				self.queue_free()
	elif chamado == false:
		node_check()
	
	if node !=null:
		vel_enemy()
		var a = move_and_collide(vel)
		if a != null:
			var b = a.get_collider()
			if b.is_in_group("enemy"):
				b.get_parent().perde_vida(dano,valor)
				b.get_parent().status(valor,dano)
				self.queue_free()
	
	morrer()
	pass

func vel_enemy():
	if node!=null:
		x = node.get_global_position()
		vel = (x - pos).normalized()*15
		pass
	else:
		queue_free()

func morrer():
	if pos.x > 1200 || pos.x < -30:
		self.queue_free()
	
	if pos.y < -20 || pos.y > 1800:
		self.queue_free()
