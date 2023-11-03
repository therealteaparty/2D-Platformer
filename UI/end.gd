extends Control

func _ready():
	$Label.text = "You made it home! You collected " + str(Global.coins) + " apples"

func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://Levels/level1.tscn")


func _on_quit_pressed():
	get_tree().quit()
