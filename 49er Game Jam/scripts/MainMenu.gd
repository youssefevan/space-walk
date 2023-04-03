extends Control

func _on_Exit_button_up():
	get_tree().quit()

func _on_Level_1_button_up():
	get_tree().change_scene("res://scenes/Levels/Level1.tscn")

func _on_Level_2_button_up():
	get_tree().change_scene("res://scenes/Levels/Level2.tscn")

func _on_Level_3_button_up():
	get_tree().change_scene("res://scenes/Levels/Level3.tscn")

func _on_Level_4_button_up():
	get_tree().change_scene("res://scenes/Levels/Level4.tscn")

func _on_Level_5_button_up():
	get_tree().change_scene("res://scenes/Levels/Level5.tscn")
