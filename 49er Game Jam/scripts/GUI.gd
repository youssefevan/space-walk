extends Control


func _ready():
	$Complete.visible = false
	$FuelIndicator.frame = 3

func _physics_process(delta):
	if Global.completed == true:
		$Complete.visible = true
		$MissionComplete.play()

func _on_Player_fuel(fuel_remaining):
	$FuelIndicator.frame = fuel_remaining
