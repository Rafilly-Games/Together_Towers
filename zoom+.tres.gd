extends TextureButton

var vetor

func _ready():
	pass # Replace with function body.




func _on_TextureButton_button_down():
	vetor = get_parent().get_parent().get_node("Camera2D").zoom
	get_parent().get_parent().get_node("Camera2D").set_zoom(Vector2(vetor.x+0.1,vetor.y+0.1))
	pass # Replace with function body.
