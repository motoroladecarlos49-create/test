extends Node2D

var player_scene = preload("res://Escenas/player.tscn")

func _ready() -> void:
	var player = player_scene.instantiate()
	if NavigationManager.next_spawn_position != Vector2.ZERO:
		player.global_position = NavigationManager.next_spawn_position
	else:
		var spawn_point = $Afuera/SpawnPoint
		player.global_position = spawn_point.global_position
		add_child(player)
