extends PathFollow2D

var vel = Vector2(0,3)
var vida 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func perde_vida(x):
	vida-=x
	if vida==0:
		self.queue_free()


func locat():
	var a = self.get_position()
	if a.y >500:
		self.queue_free()
	pass

func muda_tam():
	var x:float = vida
	var y = x/15
	var z = 1 +y
	self.set_scale(Vector2(z,z))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#move_and_slide(vel)
	
	pass
