extends Area2D

export(String, FILE) var NextLevel
var PlayerNode
func _ready():
	PlayerNode = get_tree().get_nodes_in_group("Player")[0]

func _on_Area2D_body_entered(body):
	if body == PlayerNode:
		get_tree().change_scene(NextLevel)
