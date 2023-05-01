extends Node3D

var mobList: Array[Node]
@export var mobMaterial: Material
@export var mobGradient: Gradient

@onready var animPlayer: AnimationPlayer = $AnimationPlayer_Protesters

# Called when the node enters the scene tree for the first time.
func _ready():
	animPlayer.play("Anim_Crowd_Low")
	mobList = get_tree().get_nodes_in_group("protesters")
	for node in mobList:
		if node.is_class("MeshInstance3D"):
			node.set_surface_override_material(0,mobMaterial)
			pass	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mobMaterial.albedo_color = mobGradient.sample(1-Manager.score_public/100)
	animPlayer.speed_scale = remap(Manager.score_public,0,100,5,.5)
	
	pass
