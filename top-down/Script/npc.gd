extends Area2D

@onready var animated_sprite_2d_2: AnimatedSprite2D = $AnimatedSprite2D2
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
const DIALAGO = preload("uid://cyrlyqyqrgupl")

var is_player_close = false


func _ready() -> void:
	DialogueManager.dialogue_started.connect(_on_dialogue_started)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func _process(delta: float) -> void:
	if is_player_close and Input.is_action_just_pressed("interact") and not GameManager.is_dialogue_active:
		DialogueManager.show_dialogue_balloon(DIALAGO)

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	animated_sprite_2d_2.visible = true
	animated_sprite_2d.visible = false
	is_player_close = true

func _on_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	animated_sprite_2d_2.visible = false
	animated_sprite_2d.visible = true
	is_player_close = false
	
func _on_dialogue_started(dialogue):
	GameManager.is_dialogue_active = true

func _on_dialogue_ended(dialogue):
	await get_tree().create_timer(0.2).timeout
	GameManager.is_dialogue_active = false
