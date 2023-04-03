extends Node2D

export var numPlanets: int

func _ready():
	Global.planets = numPlanets
	Global.clearedPlanets = 0
	Global.completed = false

func _input(event):
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
	
	if event.is_action_pressed("home"):
		get_tree().change_scene("res://scenes/Levels/MainMenu.tscn")
