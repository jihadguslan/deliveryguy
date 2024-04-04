extends Control

@onready var poin = $score
@onready var audio = $Audio

func _ready():
	var parent = find_parent("Deliver")
	poin.text = "Your poin : " + str(parent.poin)
	GlobalScope.latescore = parent.poin
	if parent.poin > GlobalScope.highscore :
		GlobalScope.highscore = parent.poin

func _on_restart_button_down():
	play_sound("Klik")
	Screenmanager.change_scene("res://Scene/World.tscn")

func _on_main_menu_button_down():
	play_sound("Klik")
	Screenmanager.change_scene("res://Scene/MainMenuScene.tscn")


func _on_restart_mouse_entered():
	play_sound("Hover")

func _on_main_menu_mouse_entered():
	play_sound("Hover")

func play_sound(tipe):
	if tipe == "Hover" :
		if audio.stream != preload("res://Asset/Sound/Hover.mp3") :
			audio.stream = preload("res://Asset/Sound/Hover.mp3")
		audio.play(0.0)
	if tipe == "Klik" :
		if audio.stream != preload("res://Asset/Sound/click-button-app-147358.mp3") :
			audio.stream = preload("res://Asset/Sound/click-button-app-147358.mp3")
		audio.play(0.0)
