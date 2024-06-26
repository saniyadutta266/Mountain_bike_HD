extends RigidBody2D

var wheels = []
var speed = 100000
var max_speed = 80
var original_position = Vector2()
var original_rotation = 0.0
var flip_detection_enabled = true
# Called when the node enters the scene tree for the first time.
func _ready():
	wheels = get_tree().get_nodes_in_group("Wheel1_default")
	original_rotation = rotation

func get_current_position():
	# This returns the current position of the RigidBody2D in global space (relative to the scene root)
	return global_position
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		for wheellooper in wheels:
			if wheellooper.angular_velocity < max_speed:
				wheellooper.apply_torque_impulse(speed * 60 * delta)
				
	if Input.is_action_pressed("ui_left"): # for debugging onlynot for final games
		for wheellooper in wheels:
			if wheellooper.angular_velocity > -max_speed:
				wheellooper.apply_torque_impulse(-speed * 60 * delta)

#var start_time = Time.get_ticks_msec()
#
	 ## Later in your code:
	 #var current_time = Time.get_ticks_msec()
	 #var elapsed_time_in_seconds = (current_time - start_time) / 1000.0
#
	 #if elapsed_time_in_seconds > 5:
		 #print("More than 5 seconds have passed since start.")


	if (flip_detection_enabled and rotation > 2*PI / 3 or rotation < -2*PI / 3): # for debugging
		position = get_current_position()
		rotation = original_rotation
		linear_velocity = Vector2.ZERO
		angular_velocity = 0.0
	#elif (or Time.get_ticks_msec(rotation > PI/3 or rotation < -PI/3) Time.get_ticks_msec()):
		#code to unflip same as above
	# 	var start_time = Time.get_ticks_msec()

    #  # Later in your code:
    #  var current_time = Time.get_ticks_msec()
    #  var elapsed_time_in_seconds = (current_time - start_time) / 1000.0

    #  if elapsed_time_in_seconds > 5:
    #      print("More than 5 seconds have passed since start.")
