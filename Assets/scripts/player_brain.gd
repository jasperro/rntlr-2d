
# Almost There!

extends RigidBody2D

var disabletp1
var player
var feet
var jump_height = 600
export var move_speed = 100
var player2
var samples
var restart_line

export var next_level = ''

func _ready():
	set_process(true)
	feet = get_node("Feet")
	feet.add_exception(self) # The player
	set_mode(2)
	# For collision detection
	set_contact_monitor(true)
	set_max_contacts_reported(1)


func _physics_process(delta):
	if feet.is_colliding():
		if Input.is_action_pressed("jump"):
			set_axis_velocity(Vector2(0,-jump_height))

	if Input.is_key_pressed(KEY_F):
		set_axis_velocity(Vector2(0,-jump_height))
	
	if (Input.is_action_pressed("ui_right") && Input.is_key_pressed(KEY_SHIFT)):
		set_axis_velocity(Vector2(700,0))
	elif Input.is_action_pressed("ui_right"):
		set_axis_velocity(Vector2(move_speed,0))
	if (Input.is_action_pressed("ui_left") && Input.is_key_pressed(KEY_SHIFT)):
		set_axis_velocity(Vector2(-700,0))
	elif Input.is_action_pressed("ui_left"):
		set_axis_velocity(Vector2(-move_speed,0))
	
	if Input.is_key_pressed(KEY_1):
		get_tree().change_scene("res://Levels/Level 1.tscn")
	
	if Input.is_key_pressed(KEY_2):
		get_tree().change_scene("res://Levels/Level 2.tscn")
	
	if Input.is_key_pressed(KEY_3):
		get_tree().change_scene("res://Levels/Level 3.tscn")
	
	if Input.is_key_pressed(KEY_4):
		get_tree().change_scene("res://Levels/Level 4.tscn")
	
	if Input.is_key_pressed(KEY_0):
		get_tree().change_scene("res://Levels/Platformer.tscn")
	
	if Input.is_key_pressed(KEY_X):
		print(position.x)
	
	if Input.is_key_pressed(KEY_Y):
		print(position.y)
	
	if (position.y > 950):
		print("YOU DIED")
		get_tree().reload_current_scene()
