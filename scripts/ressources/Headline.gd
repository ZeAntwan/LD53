extends Resource
class_name Headline

@export var text: String = "Test"
@export var stat_rating: int = 1
@export var stat_stock: int = 1
@export var stat_public: int = 1
@export var timer: float = 3

# Make sure that every parameter has a default value.
# Otherwise, there will be problems with creating and editing
# your resource via the inspector.
func _init(p_text = text, p_stat_rating = stat_rating, p_stat_stock = stat_stock, p_stat_public = stat_public, p_timer = timer):
	text = p_text
	stat_rating = p_stat_rating
	stat_stock = p_stat_stock
	stat_public = p_stat_public
	timer = p_timer
