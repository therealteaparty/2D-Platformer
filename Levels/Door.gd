extends Sprite2D

@onready var Player = get_node("/root/Game/Player_Container/Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player": #and Player.key == 1:
		get_tree().change_scene_to_file("res://Levels/level2.tscn")
		
