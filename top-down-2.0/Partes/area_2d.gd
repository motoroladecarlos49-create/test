extends Area2D

@export var destination_level_tag: String
@export var destination_door_tag: String
@export var spawn_direction = "up"


@onready var spawn: Marker2D = $Spawn

var is_player_close = false

func _process(delta: float) -> void:
	if is_player_close and Input.is_action_just_pressed("interact"):
		
		get_tree().change_scene_to_file("res://Escenas/afuera.tscn")
		

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	is_player_close = true
		

func _on_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	is_player_close = false
