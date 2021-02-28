extends ProgressBar


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var texc=0
var maxs
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	maxs = get_parent().get_parent().vida_max
	set_max(maxs)
	texc = get_parent().get_parent().vida
	set_value(texc)
	pass
