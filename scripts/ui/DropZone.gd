extends Control
class_name DropZone

var newsItem: NewsItem = null
var canDrop: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if newsItem == null:
		update_newsitem()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_newsitem(n: NewsItem = null):
	var oldNews = newsItem
	var hadNews = false
	if oldNews != null:
		remove_child.call_deferred(oldNews)
		hadNews = true
	newsItem = n
	if newsItem != null:
		if newsItem.get_parent() != null:
			newsItem.get_parent().remove_child(newsItem)
		add_child.call_deferred(newsItem)
		newsItem.position = Vector2.ZERO
		$ColorRect.color = Color.GREEN
	else:
		$ColorRect.color = Color.RED
	return [oldNews, hadNews]

func get_news():
	return newsItem
