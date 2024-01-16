extends Node

const PROJECTILE_CONATINER : \
String = "Projectile_container"

func get_projectil_container() -> Node2D:
	return get_tree().\
	get_first_node_in_group(PROJECTILE_CONATINER)
