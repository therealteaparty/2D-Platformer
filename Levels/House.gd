extends Sprite2D

#@onready var Player = get_node("/root/Game/Player_Container/Player")
#
#@onready var key = get_node("/root/Game/Key").get("key")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_body_entered(body):
	var key = get_node("/root/Game/Key").get("key")
	if body.name == "Player" and key == 1:
		get_tree().change_scene_to_file("res://UI/end.tscn")
		
