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

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func reset_score():
	score_rating = 50
	score_stock = 50
	score_public = 50
	progression = 0

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
		progression += delta
	pass
