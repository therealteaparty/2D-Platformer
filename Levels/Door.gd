extends Sprite2D
#var key = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	#var key = get_node_or_null("Key").key
	if body.name == "Player": #and key
		get_tree().change_scene_to_file("res://Levels/level2.tscn")
		
