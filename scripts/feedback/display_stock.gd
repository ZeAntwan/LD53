extends Node2D

@onready var highLine: Line2D = $Control/High
@onready var lowLine: Line2D = $Control/Low

@onready var displayLine: Line2D = $Control/DisplayLine

@onready var colorBG: ColorRect = $Control/ColorRect

@export var colorShift: Gradient

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in displayLine.points.size():
		displayLine.points[i] = lerp(lowLine.points[i],highLine.points[i],Manager.score_stock/100)
		pass
	pass
	
	colorBG.color = colorShift.sample(Manager.score_stock/100)
	
