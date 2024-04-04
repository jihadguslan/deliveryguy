extends Area2D

@onready var label = $label
@onready var audio = $Audio

var target
var tipe_paket = ["A", "B", "C", "D"]

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
		if target.paket == "" :
			if Input.is_action_just_pressed("Interact"):
				var selected = tipe_paket[randi() % tipe_paket.size()]
				target.pack_image.show()
				target.info_paket.text = selected
				target.paket = selected
				audio.play(0.0)
				
				

