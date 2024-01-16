class_name TurretEntity
extends CharacterBody2D

@onready var fire_timer = $Timer
@onready var tracking_handler = $TrackingHandler as TrackingHandler

@export var fire_rate : float = 0.1
@export var projectil_resource : \
ProjectileBaseResource = null

var can_fire : bool = true

func _ready():
	fire_timer.connect("timeout", set_can_fire)
	fire_timer.wait_time = fire_rate
	
func _process(delta):
	tracking_handler.track_mouse(self)
	fire_proyectile()
	
func fire_proyectile() -> void:
	if Input.is_action_just_pressed("fire") and can_fire\
	== true:
		can_fire = false
		fire_timer.start()
		print("MGLRPMQTRP")
		SignalBus.emit_fire(projectil_resource,\
		 position, (get_global_mouse_position()\
		 - global_position).normalized())
	
func set_can_fire() -> void:
	can_fire = true
