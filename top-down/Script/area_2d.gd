extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var is_player_close = false

func _process(delta: float) -> void:
	if is_player_close and Input.is_action_just_pressed("interact"):
		animated_sprite_2d.play("idle")
		await animated_sprite_2d.animation_finished
		get_tree().change_scene_to_file("res://Escenas/level_2.tscn")
		

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	is_player_close = true
		

func _on_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	is_player_close = false
