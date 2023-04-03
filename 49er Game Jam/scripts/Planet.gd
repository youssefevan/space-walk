extends Area2D

var shape = CircleShape2D.new()
var static_shape = CircleShape2D.new()

export var gravity_field_radius: float
var rot_speed: float

var orbiting := false
var in_orbit_frames := 0
var orbit_time := 180
var orbit_finished := false

func _ready():
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var rot = rand.randi_range(0, 360)
	$Sprite.rotation_degrees = rot
	rot_speed = rand.randf_range(-1, 1)
	
	in_orbit_frames = 0
	self.gravity = 5 * gravity_field_radius
	
	
	shape.set_radius(gravity_field_radius)
	static_shape.set_radius(gravity_field_radius * .16)
	$CollisionShape2D.set_shape(shape)
	$StaticBody2D/CollisionShape2D.set_shape(static_shape)
	$Sprite.scale = Vector2(gravity_field_radius/200, gravity_field_radius/200)
	$Sprite.rotation_degrees = rot

func _draw():
	# White outline of gravity radius
	draw_arc($CollisionShape2D.position, gravity_field_radius, 0, deg2rad(360), 50, Color(.2, .2, .2, 1), 1, false)
	
	# Green outline that shows progression of orbit
	draw_arc($CollisionShape2D.position, gravity_field_radius, 0,
	deg2rad(in_orbit_frames*2), 50, Color(0, 1, 0, 1), 2, false)
	

func _physics_process(delta):
	$Sprite.rotation_degrees += rot_speed
	
	if orbiting == true:
		in_orbit_frames += 1
		if orbit_finished == false:
			update()
	
	if in_orbit_frames == orbit_time:
		orbit_finished = true
		Global.clearedPlanets += 1

func _on_Planet_body_entered(body):
	if body.is_in_group("Player"):
		body.refuel()
		orbiting = true

func _on_Planet_body_exited(body):
	if body.is_in_group("Player"):
		orbiting = false
		if orbit_finished == false:
			in_orbit_frames = 0
			update()
