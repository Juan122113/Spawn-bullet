class_name  ProjectileManager
extends Node2D

@onready var base_bullet_scene : PackedScene =\
 preload("res://bullet/bullet.tscn")

func _ready():
	SignalBus.connect("fire", build_projectile)
	
func build_projectile(resource : ProjectileBaseResource, \
location : Vector2, direction : Vector2) -> void:
	var new_bullet = base_bullet_scene.instantiate() \
	as Bullet
	
	new_bullet.sprite_2d = resource.projectile_sprite
	
	new_bullet.position = location
	new_bullet.direction = \
	(direction - global_position).normalized()
	new_bullet.rotation = new_bullet.direction.angle()
	new_bullet.speed = resource.projectile_speed
	
	spawn_projectile(new_bullet)
	
func spawn_projectile(bullet : Bullet) -> void:
	var projectile_container = \
	NodeExtensions.get_projectil_container()
	
	if projectile_container == null:
		return
		
	projectile_container.add_child(bullet)
	
