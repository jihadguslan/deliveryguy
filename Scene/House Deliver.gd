extends Area2D

@onready var audio = $Audio
@onready var label = $Label
var target

func _on_body_entered(body):
	if body.name == "Deliver" :
		target = body
		label.show()

func _on_body_exited(body):
	if body.name == "Deliver" :
		target = null
		label.hide()

func _input(event):
	if target != null :
		if target.paket != "" :
			if Input.is_action_just_pressed("Interact"):
				if target.paket == name :
					if audio.stream != preload("res://Asset/Sound/click-124467.mp3") :
						audio.stream = preload("res://Asset/Sound/click-124467.mp3")
					audio.play(0.0)
					var particleG = preload("res://Scene/True.tscn").instantiate()
					add_child(particleG)
					target.pack_image.hide()
					target.poin += 1
					target.info_paket.text = ""
					target.paket = ""
				else :
					if audio.stream != preload("res://Asset/Sound/wrong-47985.mp3") :
						audio.stream = preload("res://Asset/Sound/wrong-47985.mp3")
					audio.play(0.0)
					var particleR = preload("res://Scene/False.tscn").instantiate()
					add_child(particleR)
					target.pack_image.hide()
					target.poin -= 1
					target.info_paket.text = ""
					target.paket = ""
		
