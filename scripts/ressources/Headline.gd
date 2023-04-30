extends Resource
class_name Headline

@export var text: String = "Test"
@export var stat_rating: int = 20
@export var stat_stock: int = 20
@export var stat_public: int = 20
@export var timer: float = 3

# Make sure that every parameter has a default value.
# Otherwise, there will be problems with creating and editing
# your resource via the inspector.
func _init(p_text = text, p_stat_rating = stat_rating, p_stat_stock = stat_stock, p_stat_public = stat_public, p_timer = timer):
	
	stat_rating = p_stat_rating * randf_range(-1,1)
	stat_stock = p_stat_stock * randf_range(-1,1)
	stat_public = p_stat_public * randf_range(-1,1)
	timer = p_timer
	
	text = "%s %s %s" % [stat_rating, stat_stock, stat_public]
