extends Area2D

signal launch_vector(vector)

export var max_length := 50

var click_down := false
var pos_start := Vector2.ZERO
var pos_end := Vector2.ZERO

var vector := Vector2.ZERO

var launch_color := Color.green

func _ready():
	connect("input_event", self, "_on_input_event")
	click_down = false

func _draw():
	draw_line(pos_start - global_position, pos_start - global_position - vector, Color.dimgray, 1, false)
	draw_line(pos_start - global_position, pos_start - global_position + vector, launch_color, 1, false)

func reset():
	pos_start = Vector2.ZERO
	pos_end = Vector2.ZERO
	vector = Vector2.ZERO
	update()

func _input(event):
	
	if event.is_action_released("click"):
		click_down = false
		emit_signal("launch_vector", vector)
		reset()
	
	if click_down == true:
		update()
		if event is InputEventMouseMotion:
			pos_end = event.position
			vector = -(pos_end - pos_start).clamped(max_length)

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		click_down = true
		pos_start = event.position

func _on_Player_fuel(fuel_remaining):
	if fuel_remaining < 1:
		launch_color = Color.red
	else:
		launch_color = Color.green
