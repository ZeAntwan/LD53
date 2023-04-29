extends DropZone

@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	canDrop = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if newsItem != null:
		newsItem.update_timer(1-timer.time_left/timer.wait_time)
	pass

func update_newsitem(n: NewsItem = null):
	super.update_newsitem(n)
	if newsItem != null:
		newsItem.canPick = false
		timer.wait_time = newsItem.headline.timer
		timer.start()


func _on_timer_timeout():
	# apply stats here or communicate to game manager
	newsItem.queue_free()
	update_newsitem()
	Events.emit_signal("news_ended")
	pass # Replace with function body.
