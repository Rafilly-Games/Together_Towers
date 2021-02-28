extends Camera2D

var y=0
var x=0

func zoome():
	var vetor = get_zoom()
	
	if Input.is_action_just_pressed("zoom +") && vetor.x <2:
		set_zoom(Vector2(vetor.x+0.1,vetor.y+0.1))
	if Input.is_action_just_pressed("zoom -") && vetor.x >0.1:
		set_zoom(Vector2(vetor.x-0.1,vetor.y-0.1))

func mover():
	y = -int(Input.is_action_pressed("ui_up")) +int(Input.is_action_pressed("ui_down"))
	x = -int(Input.is_action_pressed("ui_left")) +int(Input.is_action_pressed("ui_right"))
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	zoome()
	mover()
	set_global_position(get_global_position()+Vector2(x*delta*450,y*delta*450))
	pass
