extends Node2D

@onready var colorBG: ColorRect = $Control/Background
@onready var countText: Label = $Control/HBoxContainer/MarginContainer2/Label

@export_range(2,200) var viewVariance 

@export var colorShift: Gradient

# Called when the node enters the scene tree for the first time.
func _ready():
	#update_viewcount()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	colorBG.color = colorShift.sample(Manager.score_rating/100)
	pass

func update_viewcount():
	var baseViewcount = ceil(Manager.score_rating*200 + Manager.score_rating*randf_range(2,200))
	countText.text = str(baseViewcount)
	pass

func _on_timer_timeout():
	if Manager.state == Manager.GameState.PLAY:
		update_viewcount()
	pass # Replace with function body.
