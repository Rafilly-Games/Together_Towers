extends Label


onready var k = get_parent().get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	

func textao(fogo,agua,terra,vento,raio,nature,dano_sin,dano_sin_a):
	set_text(
		"Fire Towers connected: "+str(fogo-1)+
		"\nWater Towers connected: "+str(agua-1)+
		"\nEarth Towers connected: "+str(terra-1)+
		"\nWind Towers connected: "+str(vento-1)+
		"\nEnergy Towers connected: "+str(raio-1)+
		"\nNature Towers connected: "+str(nature-1)+
		"\nTotal damage per hit: "+str(dano_sin)+
		"\nDamage = "+str(dano_sin_a)+"X"+str(fogo)+"X"+str(agua)+"X"+str(terra)+"X"+str(vento)+"X"+str(raio)+"X"+str(nature)
		)
