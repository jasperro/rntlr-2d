extends Node2D

var PlayerNode
func _ready():
	PlayerNode = get_tree().get_nodes_in_group("Player")[0]

func _physics_process(_delta):
	if abs(PlayerNode.global_position.x - global_position.x) < 360:
		show()
	else:
		hide()
