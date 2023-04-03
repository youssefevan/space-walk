extends StaticBody2D

var rot_speed: float

func _ready():
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var rot = rand.randi_range(0, 360)
	$Sprite.rotation_degrees = rot
	rot_speed = rand.randf_range(-2, 2)

func _physics_process(delta):
	$Sprite.rotation_degrees += rot_speed
