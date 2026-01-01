extends Control

const SAVE_PATH = "res://save.tres"

var saveFileData:SaveGame = SaveGame.new()
var dialogIndex:int
func _save():
	ResourceSaver.save(saveFileData, SAVE_PATH)
	print(saveFileData.dialogIndex)

func _load():
	if FileAccess.file_exists(SAVE_PATH):
		saveFileData =  ResourceLoader.load(SAVE_PATH).duplicate(true)

func _ready():
	print("Kiilfew")
	_load()

func _input(event):
	if event.is_action_pressed("Shoot"):
		print("HOIEHD")
		_save()
		
