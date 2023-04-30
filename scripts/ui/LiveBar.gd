extends Control
class_name LiveBar

@onready var dropZones: Array = [
	$MarginContainer/HBoxContainer/DropZone_2,
	$MarginContainer/HBoxContainer/DropZone_3,
	$MarginContainer/HBoxContainer/DropZone_4
]
@onready var liveZone = $MarginContainer/HBoxContainer/LiveZone

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("news_ended", update_line)
	pass # Replace with function body.

func update_line():
	for i in range(dropZones.size()):
		if i == 0:
			liveZone.update_newsitem(dropZones[0].newsItem)
		else:
			dropZones[i-1].update_newsitem(dropZones[i].newsItem)
		if i == dropZones.size()-1:
			dropZones[i].update_newsitem()
	var count = 0
	for node in dropZones:
		if node.newsItem != null:
			count += 1
	if liveZone.newsItem == null && count != 0:
		update_line()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
