extends Node2D

@onready var highLine: Line2D = $Control/High
@onready var lowLine: Line2D = $Control/Low

@onready var displayLine: Line2D = $Control/DisplayLine

@onready var colorBG: ColorRect = $Control/ColorRect

@export var colorShift: Gradient

var randomA: Vector2 = Vector2(0,randf_range(-30,30))
var randomB: Vector2 = Vector2(0,randf_range(-30,30))
var randomOffset: Array[Vector2]

# Called when the node enters the scene tree for the first time.
func _ready():
	update_random()
	$Timer.timeout.connect(update_random)
	pass # Replace with function body.

func update_random():
	randomOffset.clear()
	for i in range(displayLine.points.size()):
		var off = Vector2(0,randf_range(-30,30))
		if i == 0 or i == displayLine.points.size()-1:
			off = Vector2.ZERO
			pass
		randomOffset.append(off)
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in displayLine.points.size():
		var target = lerp(lowLine.points[i]+randomOffset[i],highLine.points[i]+randomOffset[i],Manager.score_stock/100)
		displayLine.points[i] = displayLine.points[i].lerp(target,0.4)
		pass
	pass
	
	colorBG.color = colorShift.sample(Manager.score_stock/100)
	
