extends Node3D

@onready var animPlayer: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.gamestarted.connect(toggle_animation)
	Events.gameover.connect(toggle_animation)
	animPlayer.play("metarig|Idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func toggle_animation():
	if Manager.state == Manager.GameState.GAMEOVER:
		animPlayer.play("metarig|Idle")
	elif Manager.state == Manager.GameState.PLAY:
		animPlayer.play("metarig|Talking")
	pass
