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


func _on_Button_button_down():
	var g = OS.shell_open("https://twitter.com/RafillyG")
	if g != null:
		pass
	pass # Replace with function body.


func _on_Button2_button_down():
	var g =OS.shell_open("https://rafilly.itch.io/")
	if g != null:
		pass
	pass # Replace with function body.

