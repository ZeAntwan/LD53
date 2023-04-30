extends Node2D

@onready var animPlayer: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_visibility_changed():
	if visible:
		animPlayer.play("gameover_anim")
	else:
		pass
	pass # Replace with function body.


func _on_button_pressed():
	Events.emit_signal("pressed_restart")
	pass # Replace with function body.
