extends Path2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var array
var k =0
# Called when the node enters the scene tree for the first time.
func _ready():
	array = self.get_curve().get_baked_points()
	print(array)
	for i in array:
		CollisionShape2D.new()
		k+=1
	
	
	

func _draw():
	#for i in array:
	#	draw_circle(i,20,15)
	pass
