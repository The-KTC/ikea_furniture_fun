extends Node2D

func _on_button_1_pressed():
	changeScene("res://level1.tscn")

func _on_button_2_pressed():
	changeScene("res://level2.tscn")

func _on_button_3_pressed():
	changeScene("res://level3.tscn")

func _on_button_4_pressed():
	changeScene("res://level4.tscn")

func _on_button_5_pressed():
	changeScene("res://level5.tscn")

func _on_back_pressed():
	changeScene("res://start.tscn")

func changeScene(string):
	if ResourceLoader.exists(string):
		get_tree().change_scene_to_file(string)
	else:
		print("Die Szene existiert nicht.")
