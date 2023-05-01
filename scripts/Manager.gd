extends Node

enum GameState {
	MENU,
	TUTORIAL,
	READY,
	PLAY,
	GAMEOVER
}

var score_rating: float = 50
var score_stock: float = 50
var score_public: float = 50
var progression: float = 0

var state = GameState.MENU

var progressTimer = Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	progressTimer = Timer.new()
	add_child(progressTimer)
	progressTimer.wait_time = 1
	progressTimer.timeout.connect(add_progress)
	pass # Replace with function body.

func reset_score():
	score_rating = 50
	score_stock = 50
	score_public = 50
	progression = 0

func add_progress():
	progression += 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):		
	score_rating = clampf(score_rating,0,100)
	score_stock = clampf(score_stock,0,100)
	score_public = clampf(score_public,0,100)
	
	if score_rating < 1 \
		or score_stock < 1 \
		or score_public < 1:
			Events.gameover.emit()
	
	if state == GameState.PLAY:
		if progressTimer.is_stopped():
			progressTimer.start()
	else:
		if !progressTimer.is_stopped():
			progressTimer.stop()
		pass
	pass
