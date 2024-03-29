class_name Bullet
extends CharacterBody2D

@onready var sprite_2d = $Sprite2D as Sprite2D
@onready var visible_notifier = \
$VisibleNotifier as VisibleOnScreenNotifier2D
@onready var death_timer = $DeathTimer as Timer

var direction : Vector2 = Vector2.RIGHT
var speed : float = 0.0

#func _ready():
	#visible_notifier.connect("screen_exited", on_screen_exited)


func _physics_process(delta):
	move(delta)
	

func move(delta : float) -> void:
	move_and_collide(direction * speed * delta)

func _on_visible_notifier_screen_exited():
	death_timer.start(0.8)


func _on_death_timer_timeout():
	queue_free()
