extends Control
class_name NewsItem

var selected = false
var mouseOffset: Vector2 = Vector2.ZERO
var target_position: Vector2

var canPick = true

@onready var area = $Area2D
@onready var parent = get_parent()
@onready var label: RichTextLabel = %Label
@onready var hiding = $Hiding
@onready var background: TextureRect = $TextureRect

@export var icons: Array[Texture] 
@export var headline: Headline = Headline.new()
@export var ownZone: DropZone

# Called when the node enters the scene tree for the first time.
func _ready():
	set_headline(headline)
	get_parent().update_newsitem(self)
	target_position = global_position
	pass # Replace with function body.

func set_headline(h: Headline):
	if !label:
		label = %Label
	headline = h
	label.text = "[center]" + headline.text + "[/center]"
	
	var maxstat = max(headline.stat_rating,headline.stat_stock,headline.stat_public)
	
	if !background:
		background = $TextureRect
	if maxstat == headline.stat_rating:
		background.texture = icons[0]
		pass
	elif maxstat == headline.stat_stock:
		background.texture = icons[1]
		pass
	elif maxstat == headline.stat_public:
		background.texture = icons[2]
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selected:
		global_position = get_global_mouse_position() + mouseOffset
	else:
		target_position = ownZone.global_position
		global_position = global_position.lerp(target_position,.4)
	pass
	
	

func _on_area_2d_mouse_entered():
	pass # Replace with function body.


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("select") && canPick:
		selected = true
		mouseOffset = global_position - get_global_mouse_position()
		z_index = 6
	
	if Input.is_action_just_released("select") && selected:
		selected = false
		var overlap = area.get_overlapping_areas()
		if (!overlap.is_empty()):
			var targetZone = ownZone
			for node in overlap:
				if node.get_parent().is_in_group("drop_zone"):
					if (area.global_position.distance_to(node.global_position)) < (area.global_position.distance_to(targetZone.global_position)):
						targetZone = node
						pass
			var zone = targetZone.get_parent()
			if zone.is_in_group("drop_zone") && zone.canDrop && zone.newsItem != self:
				#parent.remove_child(self)
				if zone.newsItem != null:
					ownZone.update_newsitem(zone.newsItem)
					zone.update_newsitem(self)
				else:
					ownZone.update_newsitem()
					zone.update_newsitem(self)
		z_index = 1

func update_timer(ratio: float):
	hiding.scale.y = ratio

