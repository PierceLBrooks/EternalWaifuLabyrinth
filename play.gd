extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			if event.position[0] > rect_global_position[0] and event.position[1] > rect_global_position[1] and event.position[0] < rect_global_position[0]+rect_size[0] and event.position[1] < rect_global_position[1]+rect_size[1]:
				print("play")
