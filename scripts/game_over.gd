extends Node2D

@onready var animPlayer: AnimationPlayer = $AnimationPlayer
@onready var scoreLabel: RichTextLabel = %Score
@onready var gameoverLabel: RichTextLabel = $Control/ColorRect/VBoxContainer/GameoverLabel
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_visibility_changed():
	if visible:
		animPlayer.play("gameover_anim")
		
		# Update Score
		var minutes = "%0*d" % [2,floor(Manager.progression/60)]
		var seconds = "%0*d" % [2,abs(ceil((Manager.progression/60)-Manager.progression))]
		var scoreText = "%s:%s" % [minutes, seconds]
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
		pass
	pass # Replace with function body.


func _on_button_pressed():
	Events.emit_signal("pressed_restart")
	pass # Replace with function body.
