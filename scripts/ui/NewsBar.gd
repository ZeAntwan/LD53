extends Control

var item = load("res://scenes/ui/news_item.tscn")
@onready var containers = [
	$MarginContainer/VBoxContainer/DropZone_1,
	$MarginContainer/VBoxContainer/DropZone_2,
	$MarginContainer/VBoxContainer/DropZone_3,
	$MarginContainer/VBoxContainer/DropZone_4,
	$MarginContainer/VBoxContainer/DropZone_5
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		add_news(Headline.new())
	pass

func add_news(h: Headline):
	var targetNode = null
	for node in containers:
		if node.newsItem == null:
			targetNode = node
			break
	if targetNode != null:
		var instance = item.instantiate()
		targetNode.add_child(instance)
	pass
