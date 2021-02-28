extends GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_agua_button_down():
	get_parent().get_node("Label").set_text(
		"This tower wets everything aroud itself."+ 
		"\nThis tower uses almost no space and \nhas a long range."+
		"\nThis tower damage slows enemies."+
		"\nBase damage = 0.1"+
		"\nFire Cooldown: 2"
	)
	pass # Replace with function body.


func _on_raio_button_down():
	get_parent().get_node("Label").set_text(
		"This tower fires a single bullet"+ 
		"\nThis tower makes dying explode and \nfire 8 bullets"+
		"\nDeal no damage to flying units"+
		"\nBase damage = 1"+
		"\nFire Cooldown: 0.1"
	)
	pass # Replace with function body.


func _on_fogo_button_down():
	get_parent().get_node("Label").set_text(
		"This tower fires a single bullet."+ 
		"\nThis tower makes enemies burn."+
		"\n"+
		"\nBase damage = 2"+
		"\nFire Cooldown: 0.2"
	)
	pass # Replace with function body.


func _on_terra_button_down():
	get_parent().get_node("Label").set_text(
		"This tower fires lots of bullets."+ 
		"\nThis tower stun enemies on the \nfirst bullet and after some time."+
		"\nDeal no damage to flying units."+
		"\nBase damage = 1"+
		"\nFire Cooldown: 0.3"
	)
	pass # Replace with function body.


func _on_ar_button_down():
	get_parent().get_node("Label").set_text(
		"This tower hits the largest area."+ 
		"\nThis tower pushes all enemis to \nthe start, once."+
		"\n"+
		"\nBase damage = 4"+
		"\nFire Cooldown: 4"
		)
	pass # Replace with function body.


func _on_natureza_button_down():
	get_parent().get_node("Label").set_text(
		"This tower hits everything it touchs."+ 
		"\nThis tower poison enemies that touch it."+
		"\nDeal no damage to flying units."+
		"\nBase damage = 4"+
		"\nFire Cooldown: melee"
		)
	pass # Replace with function body.


func _on_enemy_button_down():
	get_parent().get_node("Label").set_text(
		"Basic enemy."+ 
		"\nTakes all damage.")
	pass # Replace with function body.


func _on_armor_enemy_button_down():
	get_parent().get_node("Label").set_text(
		"Armored enemy."+
		"\ntakes less damage from everything."+ 
		"\nTakes even less nature damage.")
	pass # Replace with function body.


func _on_fly_enem_button_down():
	get_parent().get_node("Label").set_text(
		"Basic Fly enemy."+ 
		"\nTakes no earth,light and nature damage.")
	pass # Replace with function body.


func _on_linha_button_down():
	get_parent().get_node("Label").set_text(
		"Line that conect towers"+
		"\nAll towers do damage based on \nhow many towers are conected to it."
		+"\nBasic formula is \n base dam*fire*water*eletric\n*nature*earth*air "+
		"\nThis means, having 6 diferent towers \nconected is better than having 10 \nof the same tower")
	pass # Replace with function body.


func _on_yellow_range_button_down():
	get_parent().get_node("Label").set_text(
		"Shows the range \nin with tower will connect"
	)
	pass # Replace with function body.


func _on_red_range_button_down():
	get_parent().get_node("Label").set_text(
		"Shows the range enemies will be attacked"
		)
	pass # Replace with function body.
