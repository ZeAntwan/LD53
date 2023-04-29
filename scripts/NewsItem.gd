extends Control
class_name NewsItem

var selected = false
var mouseOffset: Vector2 = Vector2.ZERO

var canPick = true

@onready var area = $Area2D
@onready var parent = get_parent()
@onready var label = $Label
@onready var hiding = $Hiding

@export var headline = Headline.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = headline.text
	get_parent().update_newsitem(self)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selected:
		global_position = get_global_mouse_position() + mouseOffset
	pass

func _on_area_2d_mouse_entered():
	pass # Replace with function body.


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("select") && canPick:
		selected = true
		mouseOffset = global_position - get_global_mouse_position()
		z_index += 1
	
	if Input.is_action_just_released("select") && selected:
		selected = false
		var overlap = area.get_overlapping_areas()
		if (!overlap.is_empty()):
			var zone = overlap[0].get_parent()
			
			if zone.is_in_group("drop_zone") && zone.canDrop:
				parent.remove_child(self)
				if zone.newsItem != null:
					var swapped = zone.update_newsitem(self)
					parent.update_newsitem(swapped)
				else:
					zone.update_newsitem(self)
			parent = get_parent()
		position = Vector2.ZERO
		z_index -= 1

func update_timer(ratio: float):
	hiding.scale.y = ratio
