extends Area2D

var rot_speed: float

func _ready():
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var rot = rand.randi_range(0, 360)
	$Sprite.rotation_degrees = rot
	rot_speed = rand.randf_range(-1, 1)

func _physics_process(delta):
	$Sprite.rotation_degrees += 1

func _on_Station_body_entered(body):
	if body.is_in_group("Player"):
		if Global.planets - Global.clearedPlanets == 0:
			Global.completed = true
