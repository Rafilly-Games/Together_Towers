extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var x
var y

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func mover():
	y = -int(Input.is_action_pressed("ui_up")) +int(Input.is_action_pressed("ui_down"))
	x = -int(Input.is_action_pressed("ui_left")) +int(Input.is_action_pressed("ui_right"))


func zoom():
	var vetor = get_node("Camera2D").get_zoom()
	
	if Input.is_action_just_pressed("zoom +") && vetor.x <2:
		print("func")
		get_node("Camera2D").set_zoom(Vector2(vetor.x+0.1,vetor.y+0.1))
	if Input.is_action_just_pressed("zoom -") && vetor.x >0.1:
		get_node("Camera2D").set_zoom(Vector2(vetor.x-0.1,vetor.y-0.1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	mover()
	zoom()
	var vel = Vector2(x,y)*8
	if get_node("Camera2D").get_global_position().x > -20 && get_node("Camera2D").get_global_position().x < 1200 && get_global_position().y > -20 && get_global_position().y < 500:
		move_and_collide(vel)
	if get_node("Camera2D").get_global_position().x <= -20:
		vel = Vector2(1,y)
		move_and_collide(vel)
	if get_node("Camera2D").get_global_position().x >= 1200:
		vel = Vector2(-1,y)
		move_and_collide(vel)
	if get_global_position().y <= -20:
		vel = Vector2(x,1)
		move_and_collide(vel)
	if get_global_position().y >= 500:
		vel = Vector2(x,-1)
		move_and_collide(vel)
	pass
