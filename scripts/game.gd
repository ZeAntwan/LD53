extends Node

@onready var mainMenu = $Menu
@onready var tutoMenu = $Tutorial
@onready var gameUI = $MainUi

@onready var mainCamera: Node3D = $MainCamera
@onready var menuCamera: Node3D = $MenuCamera
@onready var gameCamera: Camera3D = $ActiveCamera

var targetCamera: Node3D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	gameCamera.global_transform = menuCamera.global_transform
	Events.pressed_play.connect(start_game)
	Events.gameready.connect(ready_game)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if targetCamera:
		gameCamera.global_transform = gameCamera.global_transform.interpolate_with(targetCamera.global_transform, 0.1)
	pass

func start_game(restart: bool = false):
	mainMenu.visible = false
	if restart:
		Manager.state = Manager.GameState.READY
	else:
		Manager.state = Manager.GameState.TUTORIAL
		targetCamera = mainCamera
		tutoMenu.visible = true
		pass
	
func ready_game():
		Manager.state = Manager.GameState.READY
		gameUI.visible = true
		Manager.reset_score()

