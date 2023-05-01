extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HBoxContainer/Ratings/Score.text = str(Manager.score_rating)
	$HBoxContainer/Stock/Score.text = str(Manager.score_stock)
	$HBoxContainer/Public/Score.text = str(Manager.score_public)
	$HBoxContainer/Time/Score.text = str(Manager.progression)
	
	if Manager.score_rating <= 0 \
		or Manager.score_stock <= 0 \
		or Manager.score_public <= 0:
			$HBoxContainer/GameOver.visible = true
	
	
	pass
