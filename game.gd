extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var character = Sprite.new()
var background = Sprite.new()
var width = 1920
var height = 1080
var choices = []
var dispositions = {}
var names = []

func _chosen(index):
	var node = get_node("Choices")
	for choice in choices:
		node.remove_child(choice)
		choice.queue_free()
	choices.clear()
	node.visible = false
	print(str(index))

func choose(messages):
	if (len(choices) > 0):
		return
	for i in range(len(messages)):
		var message = messages[i]
		var base = get_node("Choices/ColorRect4")
		var clone = base.duplicate()
		clone.get_node("RichTextLabel").bbcode_text = "[color=white]"+message+"[/color]"
		clone.name += "_"+str(i)
		clone.context = "Choices/"+clone.name
		clone.index = i
		clone.visible = true
		clone.rect_position.y += (i-1)*128
		get_node("Choices").add_child(clone)
		choices.append(clone)
	get_node("Choices").visible = true

func go(location, person, music, text):
	var texture = ImageTexture.new()
	if (location != ""):
		texture.load("res://backs/"+location+".png")
		background.texture = texture
		background.centered = true
		background.offset.y = texture.get_size().y/2
	if (person != ""):
		if ("_" in person):
			texture.load("res://chars/"+person+".png")
		else:
			var emotion = ""
			if ("|" in text):
				var halves = text.split("|")
				emotion += halves[0]
			if (emotion == ""):
				emotion += "neutral"
			if (person in dispositions):
				var disposition = dispositions[person]
				if (emotion == "neutral"):
					if (disposition > 0.0):
						emotion = "happy"
					else:
						if (disposition < 0.0):
							emotion = "angry"
			texture.load("res://chars/"+person+"_"+emotion+".png")
		character.texture = texture
		character.centered = true
		character.offset.y = texture.get_size().y/2
		character.visible = true
	else:
		character.visible = false
	if (music != ""):
		get_node("Grim").stop()
		get_node("Melancholic").stop()
		get_node("Nostalgic").stop()
		#get_node(music).play()
	if (text != ""):
		get_node("Dialogue").visible = true
		get_node("Dialogue/ColorRect5").rect_size.x = width
		get_node("Dialogue/ColorRect5").rect_size.y = 320
		get_node("Dialogue/ColorRect5").rect_position.x = 0
		get_node("Dialogue/ColorRect5").rect_position.y = height-get_node("Dialogue/ColorRect5").rect_size.y
		get_node("Dialogue/ColorRect5/CenterContainer").rect_size = get_node("Dialogue/ColorRect5").rect_size
		if ("|" in text):
			var halves = text.split("|")
			get_node("Dialogue/ColorRect5/CenterContainer/RichTextLabel").bbcode_text = "[center][color=white]"+halves[1]+"[/color][/center]"
		else:
			get_node("Dialogue/ColorRect5/CenterContainer/RichTextLabel").bbcode_text = "[center][color=white]"+text+"[/color][/center]"
	else:
		get_node("Dialogue").visible = false


# Called when the node enters the scene tree for the first time.
func _ready():
	var sprite = Sprite.new()
	var texture = ImageTexture.new()
	texture.load("res://backs/bedroom0.png")
	sprite.texture = texture
	sprite.centered = true
	sprite.offset.y = texture.get_size().y/2
	get_node("Background").add_child(sprite)
	background = sprite
	background.translate(Vector2(width/2, 0))
	background.scale = Vector2(1.25, 1.25)
	sprite = Sprite.new()
	texture = ImageTexture.new()
	texture.load("res://chars/eua_happy.png")
	sprite.texture = texture
	sprite.centered = true
	sprite.offset.y = texture.get_size().y/2
	get_node("Background").add_child(sprite)
	character = sprite
	character.translate(Vector2(width/2, 0))
	names.append("eua")
	names.append("kyoko")
	names.append("barista")
	names.append("coworker")
	for name in names:
		dispositions[name] = 0.0
	go("", "eua", "Nostalgic", "Hi there! My name is Eua and this is a big old text display test message!")
	get_node("Foreground").visible = false
	choose(["hi", "lol", "rofl"])
	#connect("_choice", self, "_chosen")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_ESCAPE and event.pressed:
			get_node("Foreground").visible = !get_node("Foreground").visible
			if get_node("Foreground").visible:
				if (len(choices) > 0):
					get_node("Choices").visible = false
					get_node("Dialogue").visible = false
			else:
				if (len(choices) > 0):
					get_node("Choices").visible = true
					get_node("Dialogue").visible = true
