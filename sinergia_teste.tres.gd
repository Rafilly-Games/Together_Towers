extends Area2D


var x 
var linha = load("res://cenas/linha.tscn")
var array = PoolVector2Array()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_sinergia_teste_area_entered(area):
	if area.is_in_group("fogo"):
		get_parent().fogo+=1
		var k = linha.instance()
		var b =area.get_global_position()-self.get_global_position()
		array = [
			Vector2(0,0),
			b
		]
		k.set_points(array)
		k.hide()
		self.add_child(k)
		
	
	if area.is_in_group("terra"):
		get_parent().terra+=1
		var k = linha.instance()
		var b =area.get_global_position()-self.get_global_position()
		array = [
			Vector2(0,0),
			b
		]
		k.set_points(array)
		k.hide()
		self.add_child(k)
	
	if area.is_in_group("raio"):
		get_parent().raio+=1
		var k = linha.instance()
		var b =area.get_global_position()-self.get_global_position()
		array = [
			Vector2(0,0),
			b
		]
		k.set_points(array)
		k.hide()
		self.add_child(k)
		
	if area.is_in_group("nature"):
		get_parent().nature+=1
		var k = linha.instance()
		var b =area.get_global_position()-self.get_global_position()
		array = [
			Vector2(0,0),
			b
		]
		k.set_points(array)
		k.hide()
		self.add_child(k)
	
	if area.is_in_group("vento"):
		get_parent().vento+=1
		var k = linha.instance()
		var b =area.get_global_position()-self.get_global_position()
		array = [
			Vector2(0,0),
			b
		]
		k.set_points(array)
		k.hide()
		self.add_child(k)
	
	if area.is_in_group("agua"):
		get_parent().agua+=1
		var k = linha.instance()
		var b =area.get_global_position()-self.get_global_position()
		array = [
			Vector2(0,0),
			b
		]
		k.set_points(array)
		k.hide()
		self.add_child(k)
	
	get_parent().sinergia()
	get_parent().tex()


func _on_sinergia_teste_area_exited(area):
	if area.is_in_group("fogo"):
		get_parent().fogo-=1
	if area.is_in_group("terra"):
		get_parent().terra-=1
	if area.is_in_group("agua"):
		get_parent().agua-=1
	if area.is_in_group("raio"):
		get_parent().raio-=1
	if area.is_in_group("nature"):
		get_parent().nature-=1
	if area.is_in_group("vento"):
		get_parent().vento-=1
	pass # Replace with function body.
