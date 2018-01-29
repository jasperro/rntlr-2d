
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


func _process(delta):
	if feet.is_colliding():
		if Input.is_action_pressed("ui_up"):
			set_axis_velocity(Vector2(0,-jump_height))
			#samples.play('jump')
		elif Input.is_key_pressed(KEY_W):
			set_axis_velocity(Vector2(0,-jump_height))

	if Input.is_key_pressed(KEY_F):
		set_axis_velocity(Vector2(0,-jump_height))
	
	if (Input.is_action_pressed("ui_right") && Input.is_key_pressed(KEY_SHIFT)):
		set_axis_velocity(Vector2(700,0))
	elif (Input.is_key_pressed(KEY_D) && Input.is_key_pressed(KEY_SHIFT)):
		set_axis_velocity(Vector2(700,0))
	elif Input.is_action_pressed("ui_right"):
		set_axis_velocity(Vector2(move_speed,0))
	elif Input.is_key_pressed(KEY_D):
		set_axis_velocity(Vector2(move_speed,0))
	if (Input.is_action_pressed("ui_left") && Input.is_key_pressed(KEY_SHIFT)):
		set_axis_velocity(Vector2(-700,0))
	elif (Input.is_key_pressed(KEY_A) && Input.is_key_pressed(KEY_SHIFT)):
		set_axis_velocity(Vector2(-700,0))
	elif Input.is_action_pressed("ui_left"):
		set_axis_velocity(Vector2(-move_speed,0))
	elif Input.is_key_pressed(KEY_A):
		set_axis_velocity(Vector2(-move_speed,0))
	
	if Input.is_key_pressed(KEY_1):
		get_tree().change_scene("res://Levels/Level 1.xml")
	
	if Input.is_key_pressed(KEY_2):
		get_tree().change_scene("res://Levels/Level 2.xml")
	
	if Input.is_key_pressed(KEY_3):
		get_tree().change_scene("res://Levels/Level 3.xml")
	
	if Input.is_key_pressed(KEY_4):
		get_tree().change_scene("res://Levels/Level 4.xml")
	
	if Input.is_key_pressed(KEY_0):
		get_tree().change_scene("res://Levels/Platformer.xml")
	
	if restart_line in get_colliding_bodies():
		get_tree().change_scene("res://Levels/Level 1.xml")
	
	if Input.is_key_pressed(KEY_X):
		print(get_pos().x)
	
	if Input.is_key_pressed(KEY_Y):
		print(get_pos().y)
	
	if (get_pos().x > 3500 && has_node("../portal")):
		print("teleporting to level 1")
		get_tree().change_scene("res://Levels/Level 1.xml")
	
	elif (get_pos().x > 5330 && get_pos().y < -600 && has_node("../EndL1")):
		print("teleporting to level 2")
		get_tree().change_scene("res://Levels/Level 2.xml")
	
	elif (get_pos().x > 5330 && get_pos().y < -70 && has_node("../EndL2")):
		print("teleporting to level 3")
		get_tree().change_scene("res://Levels/Level 3.xml")
		
	elif (get_pos().x > 10447 && has_node("../EndL3")):
		print("teleporting to level 4")
		get_tree().change_scene("res://Levels/Level 4.xml")
		
	elif (get_pos().x > 1280 && has_node("../Hahn")):
		print("you won!")
		get_tree().change_scene("res://Levels/Platformer.xml")
	
	if (get_pos().y > 950):
		print("YOU DIED")
		get_tree().reload_current_scene()