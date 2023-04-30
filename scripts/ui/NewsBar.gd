extends Control

var item = preload("res://scenes/ui/news_item.tscn")
@onready var containers = [
	$MarginContainer/VBoxContainer/DropZone_1,
	$MarginContainer/VBoxContainer/DropZone_2,
	$MarginContainer/VBoxContainer/DropZone_3,
	$MarginContainer/VBoxContainer/DropZone_4,
	$MarginContainer/VBoxContainer/DropZone_5
]

var headlineArray: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	parse_headlines()
	Events.news_ended.connect(fill_news)
	Events.gameready.connect(fill_news)
	pass # Replace with function body.

func parse_headlines():
	var headlineFile = FileAccess.open("res://resources/headlines/headlines.csv",FileAccess.READ)
	# skip fisrt line
	headlineFile.get_csv_line()
	
	while !headlineFile.eof_reached():
		var newHeadline = Headline.new()
		var line = headlineFile.get_csv_line()
		newHeadline.text = line[1]
		newHeadline.stat_rating = float(line[2])
		newHeadline.stat_stock = float(line[3])
		newHeadline.stat_public = float(line[4])
		newHeadline.timer = float(line[5])
		headlineArray.append(newHeadline)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		fill_news()
	pass

func add_news(h: Headline):
	var targetNode = null
	for node in containers:
		if node.newsItem == null:
			targetNode = node
			break
	if targetNode != null:
		var instance = item.instantiate()
		while check_existing_headlines(h):
			h = headlineArray.pick_random()
		instance.set_headline(h)
		targetNode.add_child(instance)
		instance.position.x = -100
		return true
	else:
		return false
	pass

func fill_news(clear: bool = false):
	if clear:
		for node in containers:
			if node.newsItem != null:
				node.newsItem.queue_free()
				node.newsItem = null
	
	while add_news(headlineArray.pick_random()):
		pass

func check_existing_headlines(h: Headline):
	for node in containers:
		if node.newsItem:
			if node.newsItem.headline == h:
				return true
	return false
