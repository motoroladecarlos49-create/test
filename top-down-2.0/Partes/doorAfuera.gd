extends Area2D

@onready var lugar: Marker2D = $Spawn
@onready var player: CharacterBody2D = $"../Player"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var is_player_close = false
var spawn: Vector2


func _process(delta: float) -> void:
	if is_player_close:
		get_tree().change_scene_to_file("res://Escenas/cocina.tscn")
		spawn = lugar.global_position
		player.global_position = spawn
		

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	is_player_close = true
		

func _on_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	is_player_close = false
