extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_torre_ar_button_down():
	var x = str(get_tree().get_root().torre_clicada)
	get_tree().get_root().get_node("torre "+x)
	print("torre "+x)
	pass # Replace with function body.
