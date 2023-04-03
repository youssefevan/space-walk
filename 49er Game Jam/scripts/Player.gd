extends RigidBody2D

export var strength: float
export var fuel_remaining: int

signal fuel(fuel_remaining)

func _ready():
	fuel_remaining = 3

func _on_Launch_launch_vector(vector):
	if fuel_remaining > 0:
		vector *= Vector2(strength,strength)
		apply_central_impulse(vector)
		fuel_remaining -= 1
	emit_signal("fuel", fuel_remaining)

func refuel():
	fuel_remaining = 3
	emit_signal("fuel", fuel_remaining)
