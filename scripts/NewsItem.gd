extends Control

var selected = false
var mouseOffset: Vector2 = Vector2.ZERO

@onready var area = $Area2D
@onready var parent = get_parent()
@onready var label = $Label

@onready var headline = Headline.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = headline.text
	print(get_rect())
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selected:
		global_position = get_global_mouse_position() + mouseOffset
	pass

func _on_gui_input(event):
	if Input.is_action_just_pressed("select"):
		selected = true
		mouseOffset = global_position - get_global_mouse_position()
	if Input.is_action_just_released("select"):
		selected = false
		var overlap = area.get_overlapping_areas()
		if (!overlap.is_empty()):
			if overlap[0].get_parent().is_in_group("drop_zone"):
				parent.remove_child(self)
				parent = overlap[0].get_parent()
				parent.add_child(self)
		position = Vector2.ZERO
		


func _on_mouse_entered():
	pass # Replace with function body.


func _on_area_2d_mouse_entered():
	print("test")
	pass # Replace with function body.


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("select"):
		selected = true
		mouseOffset = global_position - get_global_mouse_position()
	if Input.is_action_just_released("select"):
		selected = false
		var overlap = area.get_overlapping_areas()
		if (!overlap.is_empty()):
			if overlap[0].get_parent().is_in_group("drop_zone"):
				parent.remove_child(self)
				parent.update_headline()
				parent = overlap[0].get_parent()
				parent.add_child(self)
				parent.update_headline(headline)
		position = Vector2.ZERO