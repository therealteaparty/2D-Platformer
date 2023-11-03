extends Node

var coins = 0

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_delta):
	if Input.is_action_just_pressed("Quit"):
		var menu = get_node_or_null("/root/Game/UI/Menu")
		if menu == null:
			get_tree().quit()
		else:
			if menu.visible:
				get_tree().paused = false
				menu.hide()
			else:
				get_tree().paused = true
				menu.show()
				
	var key = get_node_or_null("/root/Game/Key")
	var KEYFOUND = get_node_or_null("/root/Game/UI/HUD/KeyFound")
	if key != null:
		key = get_node("/root/Game/Key").get("key")
		if key == 0:
			KEYFOUND.text = "KEY: NOT FOUND"
		else: 
			KEYFOUND.text = "KEY: FOUND"


func add_coin():
	coins += 1
	var COINS = get_node_or_null("/root/Game/UI/HUD/Coins")
	if COINS != null:
		COINS.text = "APPLES: " + str(coins)
