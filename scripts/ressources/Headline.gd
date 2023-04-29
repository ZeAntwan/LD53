extends Resource
class_name Headline

@export var text: String
@export var stat_rating: int
@export var stat_stock: int
@export var stat_public: int

# Make sure that every parameter has a default value.
# Otherwise, there will be problems with creating and editing
# your resource via the inspector.
func _init(p_text = "lorem", p_stat_rating = 0, p_stat_stock = 0, p_stat_public = 0):
	text = p_text
	stat_rating = p_stat_rating
	stat_stock = p_stat_stock
	stat_public = p_stat_public
