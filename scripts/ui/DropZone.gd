extends Control

var headline = Headline

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_headline(h: Headline = null):
	headline = h
	if headline != null:
		$ColorRect.color = Color.GREEN
	else:
		$ColorRect.color = Color.RED
	pass
