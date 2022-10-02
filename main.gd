extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sprites = []
var width = 1920
var height = 1080
var offset = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	var background = get_node("Background")
	var sprite = get_node("Background/Menu")
	sprites.append(sprite)
	for i in range(100):
		var clone = sprite.duplicate()
		clone.translate(Vector2(rand_range(0, width), rand_range(0, height)))
		sprites.append(clone)
		background.add_child(clone)
	get_node("AudioStreamPlayer").play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for sprite in sprites:
		sprite.translate(Vector2(rand_range(-offset, offset), rand_range(-offset, offset)))
