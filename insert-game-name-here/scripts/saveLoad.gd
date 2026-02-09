#class_name Saver
extends Control
#Handles saving the game
const SAVE_PATH = "user://save/save"
const IMG_PATH = "res://save/thumbnail"
var saveFileNum:int = 0;

var saveFileData:SaveData = SaveData.new()
var dialogIndex:int
func _save():
	var img =  get_viewport().get_texture().get_image()
	img.resize(100,100,1)
	img.save_png(IMG_PATH+str(saveFileNum)+".png")
	ResourceSaver.save(saveFileData, SAVE_PATH+str(saveFileNum)+".tres")
	print(saveFileData.dialogIndex)

func _load(fileNum):
	if FileAccess.file_exists(SAVE_PATH+str(fileNum)+".tres"):
		saveFileData =  ResourceLoader.load(SAVE_PATH+str(fileNum)+".tres").duplicate(true)

func _ready():
	pass
	
func getThumbnail(saveNum)->String:
	var file_path = IMG_PATH+str(saveNum)+".png";
	if !FileAccess.file_exists(file_path):
		file_path = IMG_PATH+"Start.png";
	return file_path;
func _input(event):
	if event.is_action_pressed("Shoot"):
		_save()
		
