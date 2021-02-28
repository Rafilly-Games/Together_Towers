extends TextureButton


var node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_vende_torre_button_down():
	if node != null:
		node._on_vende_torre_button_down()
	get_parent().get_node("Label").textao(0,0,0,0,0,0,0,0)
	pass # Replace with function body.
