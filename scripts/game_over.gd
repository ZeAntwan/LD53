extends Node2D

@onready var animPlayer: AnimationPlayer = $AnimationPlayer
@onready var scoreLabel: RichTextLabel = %Score
@onready var gameoverLabel: RichTextLabel = $Control/ColorRect/VBoxContainer/GameoverLabel

@onready var audioGameover: AudioStreamPlayer2D = $GameOverTune
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_visibility_changed():
	if visible:
		animPlayer.play("gameover_anim")
		audioGameover.play()
		# Update Score
		var minutes = floor(Manager.progression/60)
		var seconds = int(ceil(Manager.progression)) % 60
		var txt_minutes = "%0*d" % [2,minutes]
		var txt_seconds = "%0*d" % [2,seconds]
		var scoreText = "%s:%s" % [txt_minutes, txt_seconds]
		scoreLabel.text = "[center][wave]" + scoreText + "[/wave][/center]"
		
		# Updage Gameover text
		var gameoverText: String
		if Manager.score_rating < 1:
			gameoverText = "Famous Anchorman Duke [b]fired[/b] due to bad ratings!\nA strong blow to BNN"
			pass
		elif Manager.score_stock < 1:
			gameoverText = "Famous Anchorman Duke [b]missing[/b].\nBNN to be shut down by governement"
			pass
		elif Manager.score_public < 1:
			gameoverText = "Famous Anchorman Duke [b]canceled[/b].\nBNN reputation at it's lowest"
			pass
			
		gameoverLabel.text = "[center]" + gameoverText + "[/center]"
	else:
		if audioGameover:
			audioGameover.stop()
		pass
	pass # Replace with function body.


func _on_button_pressed():
	Events.emit_signal("pressed_restart")
	pass # Replace with function body.
