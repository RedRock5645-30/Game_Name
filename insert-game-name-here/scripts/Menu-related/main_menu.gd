extends Node2D

#signal game_begin(saveFileNum)
@export var saveFileNum:int = -1
#-1 means new game, I'm thinking of having 4 save files total?, tho it really doesn't matter
func _ready() ->void:
	pass

func _on_start_btn_pressed() -> void:
	#emit_signal("game_begin", saveFileNum)
	get_tree().change_scene_to_file("res://scenes/VN-related/background.tscn")



func _on_load_btn_pressed() -> void:
	#saveFileNum = 0
	#emit_signal("game_begin", saveFileNum)
	get_tree().change_scene_to_file("res://scenes/Save-menu-related/save_files.tscn")
	#SaveLoad._load(saveFileNum)
	


func _on_acheive_btn_pressed() -> void:
	pass # Replace with function body.


func _on_settings_btn_pressed() -> void:
	pass # Replace with function body.


func _on_quit_btn_pressed() -> void:
	get_tree().quit()
