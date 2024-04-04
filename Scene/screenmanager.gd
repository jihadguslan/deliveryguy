extends CanvasLayer

@onready var anim = $AnimationPlayer

func change_scene(path):
	layer = 10
	
	anim.play("fade")
	await anim.animation_finished
	get_tree().change_scene_to_file(path)
	anim.play_backwards("fade")
	get_tree().paused = false
	layer = 0
