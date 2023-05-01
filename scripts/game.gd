extends Node

@onready var mainMenu = $Menu
@onready var tutoMenu = $Tutorial
@onready var gameUI = $MainUi
@onready var gameOverUI = $GameOver

@onready var mainCamera: Node3D = $MainCamera
@onready var menuCamera: Node3D = $MenuCamera
@onready var gameCamera: Camera3D = $ActiveCamera

@onready var endCamFired: Camera3D = $Fired_Scene_Cam
@onready var endCamRiot: Camera3D = $Riot_Scene_Cam
@onready var endCamMissing: Camera3D = $Missing_Scene_Cam

@onready var audioMusic: AudioStreamPlayer2D = $MusicLoop
@onready var audioAmb: AudioStreamPlayer2D = $AmbianceLoop

var targetCamera: Node3D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	gameCamera.global_transform = menuCamera.global_transform
	Events.pressed_play.connect(start_game)
	Events.pressed_restart.connect(restart_game)
	Events.gameready.connect(ready_game)
	Events.gamestarted.connect(game_started)
	Events.gameover.connect(game_over)
	
	Events.gameover_camera.connect(gameover_camera)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if targetCamera:
		gameCamera.global_transform = gameCamera.global_transform.interpolate_with(targetCamera.global_transform, 0.1)
	pass

func start_game(restart: bool = false):
	if !audioAmb.playing:
		audioAmb.play()
	mainMenu.visible = false
	Manager.reset_score()
	if restart:
		ready_game()
	else:
		Manager.state = Manager.GameState.TUTORIAL
		targetCamera = mainCamera
		tutoMenu.visible = true
		pass

func restart_game():
	start_game(true)
	gameUI.get_node("NewsBar").fill_news(true)
	
func ready_game():
		targetCamera = mainCamera
		gameCamera.global_transform = targetCamera.global_transform
		gameOverUI.visible = false
		Manager.state = Manager.GameState.READY
		gameUI.visible = true
		
func game_over():
		gameUI.visible = false
		Manager.state = Manager.GameState.GAMEOVER
		gameOverUI.visible = true
		audioMusic.stop()

func game_started():
	audioAmb.stop()
	audioMusic.play()
	pass

func gameover_camera():
	if Manager.score_rating < 1:
		targetCamera = endCamFired
		pass
	elif Manager.score_stock < 1:
		targetCamera = endCamMissing
		pass
	elif Manager.score_public < 1:
		targetCamera = endCamRiot
		pass
	gameCamera.global_transform = targetCamera.global_transform
