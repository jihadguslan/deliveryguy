extends Control

@onready var highest = $"Score Count/Highest"
@onready var latest = $"Score Count/Latest"
@onready var audio = $Audio

func _ready():
	highest.text = str(GlobalScope.highscore)
	latest.text = str(GlobalScope.latescore)

func _on_start_button_down():
	if audio.stream != preload("res://Asset/Sound/click-button-app-147358.mp3") :
		audio.stream = preload("res://Asset/Sound/click-button-app-147358.mp3")
	audio.play(0.0)
	Screenmanager.change_scene("res://Scene/World.tscn")

func _on_quit_button_down():
	if audio.stream != preload("res://Asset/Sound/click-button-app-147358.mp3") :
		audio.stream = preload("res://Asset/Sound/click-button-app-147358.mp3")
	audio.play(0.0)
	get_tree().quit()


func _on_start_mouse_entered():
	if audio.stream != preload("res://Asset/Sound/Hover.mp3") :
		audio.stream = preload("res://Asset/Sound/Hover.mp3")
	audio.play(0.0)

func _on_quit_mouse_entered():
	if audio.stream != preload("res://Asset/Sound/Hover.mp3") :
		audio.stream = preload("res://Asset/Sound/Hover.mp3")
	audio.play(0.0)
