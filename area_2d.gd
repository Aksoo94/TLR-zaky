extends Area2D

@export var target_scene: String
var player_nearby = false

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _process(delta):
	if player_nearby and Input.is_action_just_pressed("ui_accept"):
		change_scene()

func _on_body_entered(body):
	if body.is_in_group("Player"):
		player_nearby = true

func _on_body_exited(body):
	if body.is_in_group("Player"):
		player_nearby = false

func change_scene():
	if target_scene != "":
		get_tree().change_scene_to_file(target_scene)
	else:
		print("Error: target_scene is not set.")
